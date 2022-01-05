/**
 * @file serial_receiver.ino
 *
 * @brief minimal serial receive test
 * 
 * @copyright MIT License
 */

#include "utils.hpp"

int incomingByte = 0;

void setup(){
    Serial.begin(115200);
}

void loop(){
    if (Serial.available() > 0) {
        // read the incoming byte:
        incomingByte = Serial.read();
        // say what you got:
        Serial.print("I received: ");
        Serial.println(incomingByte, DEC);
    }
}
