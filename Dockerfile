FROM openjdk:8

# The base directory for the Android SDK
ENV ANDROID_HOME /opt/android-sdk-linux

# For some reason sdkmanager checks this file and issues a warning if it isn't there
RUN mkdir -p /root/.android && touch /root/.android/repositories.cfg

# Grab the latest commandline tools and unzip it to the proper place in the SDK directory
RUN cd /opt && \
mkdir -p ${ANDROID_HOME}/cmdline-tools && \
wget -q https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip -O commandlinetools-linux.zip && \
unzip -q commandlinetools-linux.zip -d ${ANDROID_HOME}/cmdline-tools && \
rm commandlinetools-linux.zip

# Setup the PATH to include the appropriate SDK locations
# NOTE: cmdline-tools is in here twice because the install below ends up in the latest directory
ENV PATH ${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/cmdline-tools/tools/bin

# Blindly accept the licenses ;)
RUN yes | sdkmanager --licenses

# Install the SDK packages needed by the banner app
RUN sdkmanager \
"cmdline-tools;latest" \
"platform-tools" \
"platforms;android-30" \
"platforms;android-29" \
"build-tools;30.0.2" \
"ndk;21.0.6113669" \
"extras;android;m2repository" \
"extras;google;m2repository" \
"extras;google;google_play_services" \
"add-ons;addon-google_apis-google-24"
