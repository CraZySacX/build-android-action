#!/bin/bash
export ANDROID_SDK_ROOT=/opt/android-sdk-linux
cd $GITHUB_WORKSPACE
./gradlew --no-daemon assembleDebug