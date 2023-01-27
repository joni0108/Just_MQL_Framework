//+------------------------------------------------------------------+
//|                                                   mql5Errors.mqg |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

string _ErrorDescr(int errorCodePar)
  {
   string errorStr;
   switch(errorCodePar)
     {
      case 0:    errorStr="The operation completed successfully";                                                                                                                     break;
      case 4001: errorStr="Unexpected internal error";                                                                                                                                break;
      case 4002: errorStr="Wrong parameter in the inner call of the client terminal function";                                                                                        break;
      case 4003: errorStr="Wrong parameter when calling the system function";                                                                                                         break;
      case 4004: errorStr="Not enough memory to perform the system function";                                                                                                         break;
      case 4005: errorStr="The structure contains objects of strings and/or dynamic arrays and/or structure of such objects and/or classes";                                          break;
      case 4006: errorStr="Array of a wrong type, wrong size, or a damaged object of a dynamic array";                                                                                break;
      case 4007: errorStr="Not enough memory for the relocation of an array, or an attempt to change the size of a static array";                                                     break;
      case 4008: errorStr="Not enough memory for the relocation of string";                                                                                                           break;
      case 4009: errorStr="Not initialized string";                                                                                                                                   break;
      case 4010: errorStr="Invalid date and/or time";                                                                                                                                 break;
      case 4011: errorStr="Requested array size exceeds 2 GB";                                                                                                                        break;
      case 4012: errorStr="Wrong pointer";                                                                                                                                            break;
      case 4013: errorStr="Wrong type of pointer";                                                                                                                                    break;
      case 4014: errorStr="Function is not allowed for call";                                                                                                                         break;
      case 4015: errorStr="The names of the dynamic and the static resource match";                                                                                                   break;
      case 4016: errorStr="Resource with this name has not been found in EX5";                                                                                                        break;
      case 4017: errorStr="Unsupported resource type or its size exceeds 16 Mb";                                                                                                      break;
      case 4018: errorStr="The resource name exceeds 63 charactersy";                                                                                                                 break;
      case 4101: errorStr="Wrong chart ID";                                                                                                                                           break;
      case 4102: errorStr="Chart does not respond";                                                                                                                                   break;
      case 4103: errorStr="Chart not found";                                                                                                                                          break;
      case 4104: errorStr="No Expert Advisor in the chart that could handle the event";                                                                                               break;
      case 4105: errorStr="Chart opening error";                                                                                                                                      break;
      case 4106: errorStr="Failed to change chart symbol and period";                                                                                                                 break;
      case 4107: errorStr="Error value of the parameter for the function of working with charts";                                                                                     break;
      case 4108: errorStr="Failed to create timer";                                                                                                                                   break;
      case 4109: errorStr="Wrong chart property ID";                                                                                                                                  break;
      case 4110: errorStr="Error creating screenshots";                                                                                                                               break;
      case 4111: errorStr="Error navigating through chart";                                                                                                                           break;
      case 4112: errorStr="Error applying template";                                                                                                                                  break;
      case 4113: errorStr="Subwindow containing the indicator was not found";                                                                                                         break;
      case 4114: errorStr="Error adding an indicator to chart";                                                                                                                       break;
      case 4115: errorStr="Error deleting an indicator from the chart";                                                                                                               break;
      case 4116: errorStr="Indicator not found on the specified chart";                                                                                                               break;
      case 4201: errorStr="Error working with a graphical object";                                                                                                                    break;
      case 4202: errorStr="Graphical object was not found";                                                                                                                           break;
      case 4203: errorStr="Wrong ID of a graphical object property";                                                                                                                  break;
      case 4204: errorStr="Unable to get date corresponding to the value";                                                                                                            break;
      case 4205: errorStr="Unable to get value corresponding to the date";                                                                                                            break;
      case 4301: errorStr="Unknown symbol";                                                                                                                                           break;
      case 4302: errorStr="Symbol is not selected in MarketWatch";                                                                                                                    break;
      case 4303: errorStr="Wrong identifier of a symbol property";                                                                                                                    break;
      case 4304: errorStr="Time of the last tick is not known (no ticks)";                                                                                                            break;
      case 4305: errorStr="Error adding or deleting a symbol in MarketWatch";                                                                                                         break;
      case 4401: errorStr="Requested history not found";                                                                                                                              break;
      case 4402: errorStr="Wrong ID of the history property";                                                                                                                         break;
      case 4403: errorStr="Exceeded history request timeout";                                                                                                                         break;
      case 4404: errorStr="Number of requested bars limited by terminal settings";                                                                                                    break;
      case 4405: errorStr="Multiple errors when loading history";                                                                                                                     break;
      case 4407: errorStr="Receiving array is too small to store all requested data";                                                                                                 break;
      case 4501: errorStr="Global variable of the client terminal is not found";                                                                                                      break;
      case 4502: errorStr="Global variable of the client terminal with the same name already exists";                                                                                 break;
      case 4510: errorStr="Email sending failed";                                                                                                                                     break;
      case 4511: errorStr="Sound playing failed";                                                                                                                                     break;
      case 4512: errorStr="Wrong identifier of the program property";                                                                                                                 break;
      case 4513: errorStr="Wrong identifier of the terminal property";                                                                                                                break;
      case 4514: errorStr="File sending via ftp failed";                                                                                                                              break;
      case 4515: errorStr="Failed to send a notification";                                                                                                                            break;
      case 4516: errorStr="Invalid parameter for sending a notification — an empty string or NULL has been passed to the SendNotification() function";                                break;
      case 4517: errorStr="Wrong settings of notifications in the terminal (ID is not specified or permission is not set)";                                                           break;
      case 4518: errorStr="Too frequent sending of notifications";                                                                                                                    break;
      case 4519: errorStr="FTP server is not specified";                                                                                                                              break;
      case 4520: errorStr="FTP login is not specified";                                                                                                                               break;
      case 4521: errorStr="File not found in the MQL5\\Files directory to send on FTP server";                                                                                        break;
      case 4522: errorStr="FTP connection failed";                                                                                                                                    break;
      case 4523: errorStr="FTP path not found on server";                                                                                                                             break;
      case 4524: errorStr="FTP connection closed";                                                                                                                                    break;
      case 4601: errorStr="Not enough memory for the distribution of indicator buffers";                                                                                              break;
      case 4602: errorStr="Wrong indicator buffer index";                                                                                                                             break;
      case 4603: errorStr="Wrong ID of the custom indicator property";                                                                                                                break;
      case 4701: errorStr="Wrong account property ID";                                                                                                                                break;
      case 4751: errorStr="Wrong trade property ID";                                                                                                                                  break;
      case 4752: errorStr="Trading by Expert Advisors prohibited";                                                                                                                    break;
      case 4753: errorStr="Position not found";                                                                                                                                       break;
      case 4754: errorStr="Order not found";                                                                                                                                          break;
      case 4755: errorStr="Deal not found";                                                                                                                                           break;
      case 4756: errorStr="Trade request sending failed";                                                                                                                             break;
      case 4801: errorStr="Unknown symbol";                                                                                                                                           break;
      case 4802: errorStr="Indicator cannot be created";                                                                                                                              break;
      case 4803: errorStr="Not enough memory to add the indicator";                                                                                                                   break;
      case 4804: errorStr="The indicator cannot be applied to another indicator";                                                                                                     break;
      case 4805: errorStr="Error applying an indicator to chart";                                                                                                                     break;
      case 4806: errorStr="Requested data not found";                                                                                                                                 break;
      case 4807: errorStr="Wrong indicator handle";                                                                                                                                   break;
      case 4808: errorStr="Wrong number of parameters when creating an indicator";                                                                                                    break;
      case 4809: errorStr="No parameters when creating an indicator";                                                                                                                 break;
      case 4810: errorStr="The first parameter in the array must be the name of the custom indicator";                                                                                break;
      case 4811: errorStr="Invalid parameter type in the array when creating an indicator";                                                                                           break;
      case 4812: errorStr="Wrong index of the requested indicator buffer";                                                                                                            break;
      case 4901: errorStr="Depth Of Market can not be added";                                                                                                                         break;
      case 4902: errorStr="Depth Of Market can not be removed";                                                                                                                       break;
      case 4903: errorStr="The data from Depth Of Market can not be obtained";                                                                                                        break;
      case 4904: errorStr="Error in subscribing to receive new data from Depth Of Market";                                                                                            break;
      case 5001: errorStr="More than 64 files cannot be opened at the same time";                                                                                                     break;
      case 5002: errorStr="Invalid file name";                                                                                                                                        break;
      case 5003: errorStr="Too long file name";                                                                                                                                       break;
      case 5004: errorStr="File opening error";                                                                                                                                       break;
      case 5005: errorStr="Not enough memory for cache to read";                                                                                                                      break;
      case 5006: errorStr="File deleting error";                                                                                                                                      break;
      case 5007: errorStr="A file with this handle was closed, or was not opening at all";                                                                                            break;
      case 5008: errorStr="Wrong file handle";                                                                                                                                        break;
      case 5009: errorStr="The file must be opened for writing";                                                                                                                      break;
      case 5010: errorStr="The file must be opened for reading";                                                                                                                      break;
      case 5011: errorStr="The file must be opened as a binary one";                                                                                                                  break;
      case 5012: errorStr="The file must be opened as a text";                                                                                                                        break;
      case 5013: errorStr="The file must be opened as a text or CSV";                                                                                                                 break;
      case 5014: errorStr="The file must be opened as CSV";                                                                                                                           break;
      case 5015: errorStr="File reading error";                                                                                                                                       break;
      case 5016: errorStr="String size must be specified, because the file is opened as binary";                                                                                      break;
      case 5017: errorStr="A text file must be for string arrays, for other arrays - binary";                                                                                         break;
      case 5018: errorStr="This is not a file, this is a directory";                                                                                                                  break;
      case 5019: errorStr="File does not exist";                                                                                                                                      break;
      case 5020: errorStr="File can not be rewritten";                                                                                                                                break;
      case 5021: errorStr="Wrong directory name";                                                                                                                                     break;
      case 5022: errorStr="Directory does not exist";                                                                                                                                 break;
      case 5023: errorStr="This is a file, not a directory";                                                                                                                          break;
      case 5024: errorStr="The directory cannot be removed";                                                                                                                          break;
      case 5025: errorStr="Failed to clear the directory (probably one or more files are blocked and removal operation failed)";                                                      break;
      case 5026: errorStr="Failed to write a resource to a file";                                                                                                                     break;
      case 5027: errorStr="Unable to read the next piece of data from a CSV file (FileReadString, FileReadNumber, FileReadDatetime, FileReadBool), since the end of file is reached"; break;
      case 5030: errorStr="No date in the string";                                                                                                                                    break;
      case 5031: errorStr="Wrong date in the string";                                                                                                                                 break;
      case 5032: errorStr="Wrong time in the string";                                                                                                                                 break;
      case 5033: errorStr="Error converting string to date";                                                                                                                          break;
      case 5034: errorStr="Not enough memory for the string";                                                                                                                         break;
      case 5035: errorStr="The string length is less than expected";                                                                                                                  break;
      case 5036: errorStr="Too large number, more than ULONG_MAX";                                                                                                                    break;
      case 5037: errorStr="Invalid format string";                                                                                                                                    break;
      case 5038: errorStr="Amount of format specifiers more than the parameters";                                                                                                     break;
      case 5039: errorStr="Amount of parameters more than the format specifiers";                                                                                                     break;
      case 5040: errorStr="Damaged parameter of string type";                                                                                                                         break;
      case 5041: errorStr="Position outside the string";                                                                                                                              break;
      case 5042: errorStr="0 added to the string end, a useless operation";                                                                                                           break;
      case 5043: errorStr="Unknown data type when converting to a string";                                                                                                            break;
      case 5044: errorStr="Damaged string object";                                                                                                                                    break;
      case 5050: errorStr="Copying incompatible arrays. String array can be copied only to a string array, and a numeric array - in numeric array only";                              break;
      case 5051: errorStr="The receiving array is declared as AS_SERIES, and it is of insufficient size";                                                                             break;
      case 5052: errorStr="Too small array, the starting position is outside the array";                                                                                              break;
      case 5053: errorStr="An array of zero length";                                                                                                                                  break;
      case 5054: errorStr="Must be a numeric array";                                                                                                                                  break;
      case 5055: errorStr="Must be a one-dimensional array";                                                                                                                          break;
      case 5056: errorStr="Timeseries cannot be used";                                                                                                                                break;
      case 5057: errorStr="Must be an array of type double";                                                                                                                          break;
      case 5058: errorStr="Must be an array of type float";                                                                                                                           break;
      case 5059: errorStr="Must be an array of type long";                                                                                                                            break;
      case 5060: errorStr="Must be an array of type int";                                                                                                                             break;
      case 5061: errorStr="Must be an array of type short";                                                                                                                           break;
      case 5062: errorStr="Must be an array of type char";                                                                                                                            break;
      case 5100: errorStr="OpenCL functions are not supported on this computer";                                                                                                      break;
      case 5101: errorStr="Internal error occurred when running OpenCL";                                                                                                              break;
      case 5102: errorStr="Invalid OpenCL handle";                                                                                                                                    break;
      case 5103: errorStr="Error creating the OpenCL context";                                                                                                                        break;
      case 5104: errorStr="Failed to create a run queue in OpenCL";                                                                                                                   break;
      case 5105: errorStr="Error occurred when compiling an OpenCL program";                                                                                                          break;
      case 5106: errorStr="Too long kernel name (OpenCL kernel)";                                                                                                                     break;
      case 5107: errorStr="Error creating an OpenCL kernel";                                                                                                                          break;
      case 5108: errorStr="Error occurred when setting parameters for the OpenCL kernel";                                                                                             break;
      case 5109: errorStr="OpenCL program runtime error";                                                                                                                             break;
      case 5110: errorStr="Invalid size of the OpenCL buffer";                                                                                                                        break;
      case 5111: errorStr="Invalid offset in the OpenCL buffer";                                                                                                                      break;
      case 5112: errorStr="Failed to create an OpenCL buffer";                                                                                                                        break;
      case 5200: errorStr="Invalid URL";                                                                                                                                              break;
      case 5201: errorStr="Failed to connect to specified URL";                                                                                                                       break;
      case 5202: errorStr="Timeout exceeded";                                                                                                                                         break;
      case 5203: errorStr="HTTP request failed"; 
      case 5300: errorStr="A custom symbol must be specified";                                                                                                                        break;
      case 5301: errorStr="The name of the custom symbol is invalid. The symbol name can only contain Latin letters without punctuation, spaces or special characters (may only contain '.', '_', '&' and '#'). It is not recommended to use characters <, >, :, ', /,\\, |, ?, *.";break;
      case 5302: errorStr="The name of the custom symbol is too long. The length of the symbol name must not exceed 32 characters including the ending 0 character";                  break;
      case 5303: errorStr="The path of the custom symbol is too long. The path length should not exceed 128 characters including 'Custom\\', the symbol name, group separators and the ending 0";break;
      case 5304: errorStr="A custom symbol with the same name already exists";                                                                                                        break;
      case 5305: errorStr="Error occurred while creating, deleting or changing the custom symbol";                                                                                    break;
      case 5306: errorStr="You are trying to delete a custom symbol selected in Market Watch";                                                                                        break;
      case 5307: errorStr="An invalid custom symbol property";                                                                                                                        break;
      case 5308: errorStr="A wrong parameter while setting the property of a custom symbol";                                                                                          break;
      case 5309: errorStr="A too long string parameter while setting the property of a custom symbol";                                                                                break;
      case 5310: errorStr="Ticks in the array are not arranged in the order of time";                                                                                                 break;
      case 65536: errorStr="User defined errors start with this code";                                                                                                                break;
      default:   errorStr="unknown error";
     }
//---
   if(errorStr=="unknown error")
      errorStr= _RetcodeDescr(errorCodePar);
   
   return(errorStr);
  } 
  
  
  

//+------------------------------------------------------------------+
//| return Retcode description                                       |
//+------------------------------------------------------------------+
string _RetcodeDescr(int retcodePar)
  {
   string retcodeStr;
//---
   switch(retcodePar)
     {
      //--- codes returned from trade server
      case 10004: retcodeStr="Requote";                                                                                                                break;
      case 10006: retcodeStr="Request rejected";                                                                                                       break;
      case 10007: retcodeStr="Request canceled by trader";                                                                                             break;
      case 10008: retcodeStr="Order placed";                                                                                                           break;
      case 10009: retcodeStr="Request completed";                                                                                                      break;
      case 10010: retcodeStr="Only part of the request was completed";                                                                                 break;
      case 10011: retcodeStr="Request processing error";                                                                                               break;
      case 10012: retcodeStr="Request canceled by timeout";                                                                                            break;
      case 10013: retcodeStr="Invalid request";                                                                                                        break;
      case 10014: retcodeStr="Invalid volume in the request";                                                                                          break;
      case 10015: retcodeStr="Invalid price in the request";                                                                                           break;
      case 10016: retcodeStr="Invalid stops in the request";                                                                                           break;
      case 10017: retcodeStr="Trade is disabled";                                                                                                      break;
      case 10018: retcodeStr="Market is closed";                                                                                                       break;
      case 10019: retcodeStr="There is not enough money to complete the request";                                                                      break;
      case 10020: retcodeStr="Prices changed";                                                                                                         break;
      case 10021: retcodeStr="There are no quotes to process the request";                                                                             break;
      case 10022: retcodeStr="Invalid order expiration date in the request";                                                                           break;
      case 10023: retcodeStr="Order state changed";                                                                                                    break;
      case 10024: retcodeStr="Too frequent requests";                                                                                                  break;
      case 10025: retcodeStr="No changes in request";                                                                                                  break;
      case 10026: retcodeStr="Autotrading disabled by server";                                                                                         break;
      case 10027: retcodeStr="Autotrading disabled by client terminal";                                                                                break;
      case 10028: retcodeStr="Request locked for processing";                                                                                          break;
      case 10029: retcodeStr="Order or position frozen";                                                                                               break;
      case 10030: retcodeStr="Invalid order filling type";                                                                                             break;
      case 10031: retcodeStr="No connection with the trade server";                                                                                    break;
      case 10032: retcodeStr="Operation is allowed only for live accounts";                                                                            break;
      case 10033: retcodeStr="The number of pending orders has reached the limit";                                                                     break;
      case 10034: retcodeStr="The volume of orders and positions for the symbol has reached the limit";                                                break;
      case 10035: retcodeStr="Incorrect or prohibited order type";                                                                                     break;
      case 10036: retcodeStr="Position with the specified POSITION_IDENTIFIER has already been closed";                                                break;
      case 10038: retcodeStr="A close volume exceeds the current position volume";                                                                     break;
      case 10039: retcodeStr="A close order already exists for a specified position. This may happen when working in the hedging system:           \n"+
                                 "1) when attempting to close a position with an opposite one, while close orders for the position already exist   \n"+
                                 "2) when attempting to fully or partially close a position if the total volume of the already present close orders\n"+
                                 "and the newly placed one exceeds the current position volume";                                                       break;

      default:   retcodeStr="unknown error";
     }
//---
   return(retcodeStr);
  } 
  
