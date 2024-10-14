FROM ballerina/ballerina:latest
COPY main.bal /home/ballerina/main.bal
WORKDIR /home/ballerina
RUN ballerina build main.bal
CMD ["ballerina", "run", "target/bin/main.jar"]
