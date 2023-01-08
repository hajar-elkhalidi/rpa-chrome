FROM bitnami/minideb:latest

LABEL maint="hajar" desc="RPA Framework in Docker, with Google Chrome"

RUN apt-get -q update; \
    apt-get -q install python3 pip wget unzip xvfb -y; \
    apt-get clean; apt-get autoremove

# Google Chrome
# Check available versions here: https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable
ARG CHROME_VERSION="108.0.5359.124-1"
RUN wget --no-verbose -O /tmp/chrome.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb \
    && apt install -y /tmp/chrome.deb \
    && rm /tmp/chrome.deb

# Chrome Driver
# Check available versions here: https://chromedriver.chromium.org/downloads
ARG DRIVER_VERSION="108.0.5359.71"
RUN wget --no-verbose https://chromedriver.storage.googleapis.com/${DRIVER_VERSION}/chromedriver_linux64.zip \
    && unzip -q chromedriver_linux64.zip \
    && rm chromedriver_linux64.zip \
    && chmod +x chromedriver \
    && mv /chromedriver /usr/local/bin

# RPA Framework https://rpaframework.org/
RUN pip install -q rpaframework
