#!/bin/bash
export ANDROID_SDK_ROOT=/opt/android-sdk-linux
export GRADLE_USER_HOME=~/.gradle
cd $GITHUB_WORKSPACE
./gradlew --no-daemon assembleDebug