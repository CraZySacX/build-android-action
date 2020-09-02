#!/bin/bash
export ANDROID_SDK_ROOT=/opt/android-sdk-linux
export GRADLE_USER_HOME=${GITHUB_WORKSPACE}/.gradle_user_home
cd $GITHUB_WORKSPACE
./gradlew --no-daemon assembleDebug