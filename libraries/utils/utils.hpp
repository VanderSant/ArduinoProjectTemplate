/**
 * @file  utils.hpp
 *
 * @brief utils functions
 * 
 * @copyright MIT License
 */

#ifndef __UTILS_HPP__
#define __UTILS_HPP__

#include <iostream>
#include <string>
#include <cstring>

/*****************************************
 * Public function declarations
 *****************************************/
/**
 * @brief tranform a string to char array pointer
 * 
 * @param str string to be tranform
 * 
 * @return return a char pointer with the str value
 */
char* string_to_char(std::string str);

#endif //__UTILS_HPP__