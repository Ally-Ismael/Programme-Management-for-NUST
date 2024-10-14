import ballerina/http;
import ballerina/log;
import ballerina/kafka;
import ballerina/sql;
import ballerina/mysql;

// Kafka Producer
kafka:Producer kafkaProducer = check new (kafka:DEFAULT_URL, kafka:ProducerConfig {
    clientId: "logistics-service-producer",
    acks: "all"
});

// MySQL Client
mysql:Client dbClient = check new (host = "xampp", port = 3306, user = "root", password = "", database = "logistics_db");

service /logistics on new http:Listener(8080) {
    resource function post request(http:Caller caller, http:Request req) returns error? {
        json payload = check req.getJsonPayload();
        string type = check payload.type.toString();
        string pickupLocation = check payload.pickup_location.toString();
        string deliveryLocation = check payload.delivery_location.toString();
        string timeSlot = check payload.preferred_time_slot.toString();
        string customerInfo = check payload.customer_info.toString();

        // Process the request
        log:printInfo("Processing request for " + type + " delivery.");

        // Send to appropriate delivery service via Kafka
        check kafkaProducer->send({
            topic: type,
            value: payload.toString()
        });

        // Respond to client
        check caller->respond("Request received and being processed.");
    }
}
