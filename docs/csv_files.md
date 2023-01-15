# CCSVFile class
This class will help you handling csv files on a very easy way <br>

## Highlighted Features
- Write data to an specific cell by its position.
- Read data from an specific cell by its poisition.

## Understanding CSV files
In order to avoid errors and unexpected results, please be sure to read. <br>
For using the methods that allows you to setand get data from a cell by its position you must know the amount of columns and rows that the file does have. <br>
A failure to provide these parameters wrong will result on wrong data returned and unexpected errors. <br>
However, you can read data from the file without knowing these parameters, but you won't be able to use the methods that uses cell coordinates to do so.

### How to get the columns and rows amount?

- You must count columns and rows from the cell A1 to the last cell with `data != ""`, drawing a mental rectangle over the data. See the example below: <br>

![Img1](res/img1.png)

<br>
Let's try another example:
<br>

In this example we accidentaly added a `value` to the cell `M72` which extended our rectangle, if we failed to provide `13 columns` and `72 rows`, then our requests will return wrong data.

<br>

![Img2](res/img2.png)

## Usage
```cpp
#include <Just_MQL_Framework/main.mqh> //Include the framework

//Creating a class object
CCSVFile file;
,"","","");  //ROW 1
FileWrite(handle,"","","","");  //ROW 2
FileWrite(handle,"","","","OLD");  //ROW 3
FileWrite(handle,"","ENDLINE","","");  //ROW 4

//Clos the file
FileClose(handle);

//Constructor ()
file.Constructor("test",NULL,false,4,4);

//Our target cell will be 'D3', with coordinates -> row: 3 | col: 4
//We will read that cell:
Print(file.ReadCell(3,4));  //The return should be 'OLD'

//We will change that cell value to 'NEW'
if(!file.WriteCell(3, 4, "NEW"))
      Print("ERROR OCURRED");

//We will read agaoin that cell to see if it changed
Print(file.ReadCell(3,4));  //The return should be 'NEW'

//Now we will try to find the cell with the value 'ENDLINE' that should be in coordinates -> row: 4 | col: 2
int row;    //To save the row coord
int col;    //To save the col coord
   
file.FindCell("ENDLINE",row, col);

//Now return the coordinates as an output
Print("POSITION: row: " + (string)row + " | col: " + (string)col);  //Result should be 'POSITION: row: 4 | col: 2'
```

The Final generated csv looks like these: <br>
![Img3](res/img3.png)

<br>

## Class Methods
```cpp
   void              Constructor(string name, string path = NULL, bool commonFlag = false, int rows = -1, int columns = -1);  //Constructor, call it when creating the object.
   bool              Read(string &returned[]);                                                                                //Reads the whole file and return the data into an array.
   string            ReadCell(int row, int col);                                                                              //Reads an specific cell value.
   bool              WriteCell(int row, int col, string toWrite);                                                             //Write data to an specific cell
   bool              FindCell(string toFind, int &resRow, int &resCol);                                                       //Finds a value in a cell and return the first found coordinates to the given variables.
   bool              Rename(string newName);                                                                                  //Renames the file
   bool              Move(string newPath, bool deleteFolder = false);                                                         //Moves the file to a new path
   bool              Delete();                                                                                                //Deletes the file

   //--- Getters
   string            GetFileName() { return m_fileName; }                                    //Return the file name
   string            GetFilePath() { return m_filePath; }                                    //Return the file path
   string            GetFileExtension() { return m_fileExtension; }                          //Return the file extension
   string            GetFullPath() { return m_filePath + m_fileName + m_fileExtension; }     //Return the full path
   bool              IsCommon() { return m_inCommonFolder; }                                 //Return if the file is in the common folder or not
```

## Notes
You must call the non-default class constructor in the `OnInit()` or `OnStart` function before using the rest of the class methods. Use `<objName>.Constructor(<parameters>);` for doing that.