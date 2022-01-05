/**
 * @file serial_send.ino
 *
 * @brief minimal serial SENDER test
 * 
 * @copyright MIT License
 */

void setup(){
    Serial.begin(115200);
}

void loop(){
    Serial.write(45); // send a byte with the value 45
    int bytesSent = Serial.write("hello");  //send the string "hello" and return the length of the string.
}