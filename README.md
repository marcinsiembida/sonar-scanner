Go to http://sonarqube-plrnd.g02.fujitsu.local and there:
- create project -> manually
- insert project name
- select: with gitlab ci
- select what option best describes your build
- go back to your gitlab project and create in the main branch of your repo file "sonar-project.properties" and insert there code that sonarqube will generate
- after that you have to go to
- gitlab -> project settings -> CI/CD -> variables
- go back to sonarqube and follow instructions 
- go back to repo and there create .gitlab-ci.yml and paste content that you will see below
Your gitlab-ci.yml should look like this:


sonarqube-check:
  image:
    name: gitlab-plrnd.g02.fujitsu.local:5050/sonarqube-fujitsu/sonar-scanner
    entrypoint: [""]
  variables:
    SONAR_USER_HOME: "${CI_PROJECT_DIR}/.sonar"  # Defines the location of the analysis task cache
    #: ${YOUR_CERTS_DIR}/cacerts:/tmp/cacerts
    SONAR_SCANNER_OPTS: "-Djavax.net.ssl.trustStore=/etc/ssl/certs/java/cacerts -Djavax.net.ssl.trustStorePassword=changeit"
    GIT_DEPTH: "0"  # Tells git to fetch all the branches of the project, required by the analysis task
  cache:
    key: "${CI_JOB_NAME}"
    paths:
      - .sonar/cache
  script:
    - sonar-scanner
    # -X -Djavax.net.debug="ssl,handshake"
  allow_failure: true
  only:
  - main # or the name of your main branch

After pasting this code into your gitlab-ci file, go back to sonarqube and click finish this tutorial. If everyting was done correctly, after a while you should see result of your actions and statistics from sonarqube.
