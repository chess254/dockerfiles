FROM codesignal/ubuntu-base:v5.0

# Based on instructions here:
# https://dotnet.microsoft.com/download/linux-package-manager/ubuntu16-04/sdk-current

# register Microsoft key and feed
RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb

# need this to skip Y/n questions during SDK install
ENV DEBIAN_FRONTEND='noninteractive'

# Install .NET SDK
RUN apt-get install apt-transport-https
RUN apt-get update
RUN apt-get -yq install dotnet-sdk-2.2

# Verify
RUN dotnet --version
