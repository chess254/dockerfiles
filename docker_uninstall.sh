#!/bin/bash

sudo rm -rf \
  /Library/PrivilegedHelperTools/com.docker.vmnetd \
  /Library/LaunchDaemons/com.docker.vmnetd.plist \
  /usr/local/lib/docker \
  ~/.docker \
  ~/Library/Application Support/Docker Desktop \
  ~/Library/Preferences/com.docker.docker.plist \
  ~/Library/Saved Application State/com.electron.docker-frontend.savedState \
  ~/Library/Group Containers/group.com.docker \
  ~/Library/Logs/Docker Desktop \
  ~/Library/Preferences/com.electron.docker-frontend.plist \
  ~/Library/Cookies/com.docker.docker.binarycookies