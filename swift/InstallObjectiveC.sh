#!/bin/bash

# taken from http://wiki.gnustep.org/index.php/GNUstep_under_Ubuntu_Linux
# with small modifications (j8 -> j4, --add-architecture i386, and no debug info)

# Show prompt function
function showPrompt()
{
  if [ "$PROMPT" = true ] ; then
    echo -e "\n\n"
    read -p "${GREEN}Press enter to continue...${NC}"
  fi
}

# Set colors
GREEN=""
NC="" # No Color

# Set to true to also build and install apps
APPS=false

# Set to true to pause after each build to verify successful build and installation
PROMPT=false

# Install Requirements
sudo dpkg --add-architecture i386
sudo apt update

echo -e "\n\n${GREEN}Installing dependencies...${NC}"
sudo apt -y install clang git cmake libffi-dev libxml2-dev \
libgnutls28-dev libicu-dev libblocksruntime-dev libkqueue-dev libpthread-workqueue-dev autoconf libtool \
libjpeg-dev libtiff-dev libffi-dev libcairo-dev libx11-dev:i386 libxt-dev libxft-dev

if [ "$APPS" = true ] ; then
  sudo apt -y install curl
fi

# Create build directory
mkdir GNUstep-build
cd GNUstep-build

# Set clang as compiler
export CC=clang
export CXX=clang++

# Checkout sources
echo -e "\n\n${GREEN}Checking out sources...${NC}"
git clone https://github.com/nickhutchinson/libdispatch.git
git clone https://github.com/gnustep/libobjc2.git
git clone https://github.com/gnustep/tools-make.git
git clone https://github.com/gnustep/libs-base.git
git clone https://github.com/gnustep/libs-gui.git
git clone https://github.com/gnustep/libs-back.git

if [ "$APPS" = true ] ; then
  git clone https://github.com/gnustep/apps-projectcenter.git
  git clone https://github.com/gnustep/apps-gorm.git
  git clone https://github.com/gnustep/apps-gworkspace.git
  git clone https://github.com/gnustep/apps-systempreferences.git
fi

showPrompt

# Build GNUstep make first time
echo -e "\n\n"
echo -e "${GREEN}Building GNUstep-make for the first time...${NC}"
cd tools-make
git checkout `git rev-list -1 --first-parent --before=2017-04-06 master` # fixes segfault, should probably be looked at.
./configure --with-layout=gnustep --enable-objc-nonfragile-abi --enable-objc-arc
make -j4
sudo -E make install

. /usr/GNUstep/System/Library/Makefiles/GNUstep.sh
echo ". /usr/GNUstep/System/Library/Makefiles/GNUstep.sh" >> ~/.bashrc

showPrompt

# Build libdispatch
echo -e "\n\n"
echo -e "${GREEN}Building libdispatch...${NC}"
cd ../libdispatch
rm -Rf build
mkdir build && cd build
../configure  --prefix=/usr
make
sudo make install
sudo ldconfig

showPrompt

# Build libobjc2
echo -e "\n\n"
echo -e "${GREEN}Building libobjc2...${NC}"
cd ../../libobjc2
git checkout 1.9 # https://github.com/gnustep/libs-base/issues/23
rm -Rf build
mkdir build && cd build
cmake ../ -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang -DCMAKE_ASM_COMPILER=clang -DTESTS=OFF
cmake --build .
sudo -E make install
sudo ldconfig

export LDFLAGS=-ldispatch

showPrompt

OBJCFLAGS="-fblocks -fobjc-runtime=gnustep-1.8.1"

# Build GNUstep make second time
echo -e "\n\n"
echo -e "${GREEN}Building GNUstep-make for the second time...${NC}"
cd ../../tools-make
./configure --with-layout=gnustep --enable-objc-nonfragile-abi --enable-objc-arc
make -j4
sudo -E make install

. /usr/GNUstep/System/Library/Makefiles/GNUstep.sh

showPrompt

# Build GNUstep base
echo -e "\n\n"
echo -e "${GREEN}Building GNUstep-base...${NC}"
cd ../libs-base/
./configure
make -j4
sudo -E make install

showPrompt

# Build GNUstep GUI
echo -e "\n\n"
echo -e "${GREEN} Building GNUstep-gui...${NC}"
cd ../libs-gui
./configure
make -j4
sudo -E make install

showPrompt

# Build GNUstep back
echo -e "\n\n"
echo -e "${GREEN}Building GNUstep-back...${NC}"
cd ../libs-back
./configure
make -j4
sudo -E make install

showPrompt

. /usr/GNUstep/System/Library/Makefiles/GNUstep.sh

if [ "$APPS" = true ] ; then
  echo -e "${GREEN}Building ProjectCenter...${NC}"
  cd ../apps-projectcenter/
  make -j4
  sudo -E make install

  showPrompt

  echo -e "${GREEN}Building Gorm...${NC}"
  cd ../apps-gorm/
  make -j4
  sudo -E make install

  showPrompt

  echo -e "\n\n"
  echo -e "${GREEN}Building GWorkspace...${NC}"
  cd ../apps-gworkspace/
  ./configure
  make -j4
  sudo -E make install

  showPrompt

  echo -e "\n\n"
  echo -e "${GREEN}Building SystemPreferences...${NC}"
  cd ../apps-systempreferences/
  make -j4
  sudo -E make install

fi

echo -e "\n\n"
echo -e "${GREEN}Install is done. Open a new terminal to start using.${NC}"
