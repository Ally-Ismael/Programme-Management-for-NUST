import ballerinax/kafka;
import ballerina/log;

// Kafka Consumer for standard delivery
kafka:Consumer consumer = new({
    groupId: "internation_delivery_group",
    topics: ["logistics-requests"],
    bootstrapServers: "localhost:9092"
});

service on consumer {
    resource function onMessage(kafka:ConsumerRecord[] records) returns error? {
        foreach var record in records {
            log:printInfo("Processing international delivery for: " + record.value.toString());
            // Logic for processing standard delivery
        }
    }
}

