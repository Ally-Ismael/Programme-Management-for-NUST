import ballerina/http;
import ballerina/io;
import ballerina/mysql;
import ballerina/log;

// Configure MySQL client
mysql:Client dbClient = new({
    host: "localhost",
    port: 3306,
    user: "root", // Use your MySQL username
    password: "", // Use your MySQL password
    database: "logistics"
});

service /logistics on new http:Listener(8080) {

    resource function get send(http:Caller caller, http:Request req) returns error? {
        json form = {
            "form": {
                "fields": [
                    {"label": "First Name", "name": "first_name", "type": "text"},
                    {"label": "Last Name", "name": "last_name", "type": "text"},
                    {"label": "Contact Number", "name": "contact_number", "type": "text"},
                    {"label": "Shipment Type", "name": "shipment_type", "type": "text"},
                    {"label": "Pickup Location", "name": "pickup_location", "type": "text"},
                    {"label": "Delivery Location", "name": "delivery_location", "type": "text"},
                    {"label": "Pickup Time", "name": "pickup_time", "type": "text"},
                    {"label": "Delivery Time", "name": "delivery_time", "type": "text"}
                ]
            }
        };
        return caller->respond(form);
    }

    resource function post send(http:Caller caller, http:Request req) returns error? {
        json payload = check req.getJsonPayload();

        sql:ParameterizedQuery sqlQuery = `INSERT INTO shipments (first_name, last_name, contact_number, shipment_type, pickup_location, delivery_location, pickup_time, delivery_time) VALUES (${payload.first_name}, ${payload.last_name}, ${payload.contact_number}, ${payload.shipment_type}, ${payload.pickup_location}, ${payload.delivery_location}, ${payload.pickup_time}, ${payload.delivery_time})`;
        _ = check dbClient->execute(sqlQuery);

        return caller->respond("Request received and stored");
    }
}
