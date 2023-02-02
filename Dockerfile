FROM sonarsource/sonar-scanner-cli:4.7
COPY cacerts /usr/lib/jvm/default-jvm/jre/lib/security/cacerts
