# RPA Framework in Docker, with Chrome

## Description

This project consists of a Docker image containing RPA Framework package.

This image also contains Chrome and its equivalant driver.
The resources, test cases and reports should be mounted as volumes.

## Versioning

The versions used are:

* [RPA Framework](https://pypi.org/project/rpaframework/)
* Google Chrome 108.0.5359.124-1 
* Chrome Driver 108.0.5359.71 

## Running the container

Pull the image :

        docker pull hajare/rpa-chrome


After pulling the image, run the container using the following command:

  
        docker run \
        -v <path to the resources folder>:/resources \
        -v <path to the tests folder>:/tests \
        -v <path to results folder>:/results \
        --rm hajare/rpa-chrome \
        bash -c "robot tests/" \ 
        --outputdir /results /tests/


## Change chrome and driver versions

Changing versions of both chrome and chrome driver can be easily done by passing the values at build-time of the Dockerfile:


        --build-arg CHROME_VERSION=<VERSION> \
        --build-arg DRIVER_VERSION=<VERSION>

> Available Chrome and Chrome Driver versions:

* [Chrome Versions](https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable)

* [Driver Versions](https://chromedriver.chromium.org/downloads)

## Customize Dockerfile to install requirements and run tests

1. Add the following lines at the end of the Dockerfile

        
        COPY requirements.txt .
        RUN pip install requirements.txt

        ENTRYPOINT ["robot"]
        

1. Build the new docker image

    
        docker build -t <name:tag> .
    

1. Run the container
    
    
        docker run \
        -v <path to the resources folder>:/resources \
        -v <path to the tests folder>:/tests \
        -v <path to results folder>:/results \
        --rm <name:tag> \
        --outputdir /results /tests/


## GitHub Actions and GitLab CI/CD

This image can be used in GitHub actions and GitLab CI/CD as follows:

* _**GitLab**_ : **.gitlab-ci.yml**

        image: hajare/rpa-chrome

        test:
        stage: test
        script:
            - robot tests/

* _**GitHub**_ : **main.yml**

        jobs:
          test:
            runs-on: ubuntu-latest
            container: hajare/rpa-chrome:latest

        steps:
        - uses: actions/checkout@v2
        - name: Run RobotFramework tests
            run: |
            robot tests/

