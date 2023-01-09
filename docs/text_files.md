# CAccount class
This class will help you handle files, it is a big extension of the CFile built-in class <br>

## Usage
```cpp
#include <Just_MQL_Framework/main.mqh> //Include the framework

//Creatin a class object
CTextFile myFile;

int OnInit()
{
    myFile.Constructor("myFileName");
    myFile.Create("This is my little file");
    myFile.Add("This is the second line");
    
    //--- 2 ways to read the whole file lines
    //First way, by using the ReadLine() function
    for(int i = 0; i < myFile.CountLines(), i++>)
    {
        Print(myFile.ReadLine(i + 1));
    }

    //Second way, is by accessing the array
    myFile.ReadFull();

    for(int i = 0; i < myFile.CountLines(), i++)
    {
        Print(myFile.FullFileLines[i]);
    }
}
```
## Class Methods
```cpp
//Class methods
   void              Constructor(string name, string path = NULL, bool commonFlag = false, ENUM_FILE_TYPE fileType = TXT);    //Class Constructor
   bool              Create(string baseText = "");                                                                            //Create the file with a base text
   bool              AddText(string text);                                                                                    //Adds a text line to the file
   string            Read();                                                                                                  //Read the first line of the file
   string            ReadLine(int lineNum);                                                                                   //Read an specific line of the file
   int               CountLines();                                                                                            //Return the amount of lines of the document
   bool              DeleteLine(int lineNum);                                                                                 //Deletes an specific line
   int               GetLinePosition(string textToFind);                                                                      //Return the line posicion of a given string if found
   bool              Rename(string newName);                                                                                  //Renames the file
   bool              Move(string newPath, bool deleteFolder = false);                                                         //Moves the file to a new path
   bool              Delete();                                                                                                //Deletes the file
   void              ReadFull();                                                                                              //This updates the FullFileLines[] array to be used later.

   //--- Getters
   string            GetFileName() { return m_fileName; }                                    //Return the file name
   string            GetFilePath() { return m_filePath; }                                    //Return the file path
   string            GetFileExtension() { return m_fileExtension; }                          //Return the file extension
   string            GetFullPath() { return m_filePath + m_fileName + m_fileExtension; }     //Return the full path
   bool              IsCommon() { return m_inCommonFolder; }                                 //Return if the file is in the common folder or not
   string            FullFileLines[];                                                        //Is an array with all the document lines. ReadFull() must be called before updating the lines.
```

## Notes
You must call the non-default class constructor in the `OnInit()` or `OnStart` function before using the rest of the class methods. Use `<objName>.Constructor(<parameters>);` for doing that.