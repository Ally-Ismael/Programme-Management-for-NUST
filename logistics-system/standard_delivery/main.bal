import ballerina/log;
import ballerina/kafka;

// Kafka Consumer
kafka:Consumer kafkaConsumer = check new (kafka:DEFAULT_URL, kafka:ConsumerConfig {
    groupId: "standard-delivery-group",
    topics: ["standard"],
    pollingInterval: 1
});

service /standardDelivery on new http:Listener(8081) {
    resource function get status(http:Caller caller, http:Request req) returns error? {
        // Handle status requests
        check caller->respond("Standard Delivery Service is up and running.");
    }
}

function init() {
    // Kafka consumer logic to process standard delivery requests
    kafkaConsumer.attachConsumer(consumerService);
    kafkaConsumer->start();
}

service consumerService = service {
    resource function onMessage(kafka:ConsumerAction consumerAction, kafka:ConsumerRecord[] records) returns error? {
        foreach var record in records {
            log:printInfo("Standard delivery request received: " + record.value.toString());
            // Process the record and update status in the database
        }
    }
};
