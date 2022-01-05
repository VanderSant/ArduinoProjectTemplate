/**
 * @file  utils.cpp
 *
 * @brief utils functions
 * 
 * @copyright MIT License
 */

#include "utils.hpp"

/*****************************************
 * Public function
 *****************************************/
char* string_to_char(std::string str) {
   char* cstr = new char[str.size() + 1];
   strcpy(cstr, str.c_str());
   return cstr;
};