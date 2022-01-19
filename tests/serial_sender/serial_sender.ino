/**
 * @file serial_send.ino
 *
 * @brief minimal serial SENDER test
 * 
 * @copyright MIT License
 */

void setup(){
    Serial.begin(9600);
}

void loop(){
    Serial.write("hello\n");  //send the string "hello" and return the length of the string.
    delay(1);
}