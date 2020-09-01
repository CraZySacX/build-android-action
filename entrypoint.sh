#!/bin/bash
export ANDROID_SDK_ROOT=/opt/android-sdk-linux
cd $GITHUB_WORKSPACE
pwd
echo $ANDROID_SDK_ROOT
./gradlew assembleDebug