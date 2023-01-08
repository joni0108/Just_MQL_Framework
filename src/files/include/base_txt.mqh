//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum ENUM_FILE_TYPE
  {
   TXT = 0,
   DAT = 1,
   LOGS = 2,
   SIGNAL = 3
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTextFile
  {
public:

   //--- Constructor
                     CTextFile() {}
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
   string            FullFileLines[];                                                        //Is an array with all the document lines. ReadFull() must be called before to update the lines.

private:
   string            m_fileName;
   string            m_filePath;
   string            m_fileExtension;
   bool              m_inCommonFolder;
   int               m_hFile;
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTextFile::Constructor(string name,string path=NULL,bool commonFlag=false,ENUM_FILE_TYPE fileType=0)
  {
   m_hFile = INVALID_HANDLE;
   m_fileName = name;
   m_filePath = path;
   m_inCommonFolder = commonFlag;

   if(fileType == TXT)
     {
      m_fileExtension = ".txt";
     }
   else
      if(fileType == DAT)
        {
         m_fileExtension = ".dat";
        }
      else
         if(fileType == LOGS)
           {
            m_fileExtension = ".logs";
           }
         else
            if(fileType == SIGNAL)
              {
               m_fileExtension = ".signal";
              }
            else
              {
               m_fileExtension = ".txt";
              }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTextFile::ReadFull(void)
  {
   int amount = this.CountLines();

   ArrayResize(this.FullFileLines,amount);

   for(int i=0; i<amount; i++)
     {
      this.FullFileLines[i] = this.ReadLine(i + 1);
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::Create(string baseText = "")
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
     }

   if(!FileWrite(fileHandle, baseText))
     {
      FileClose(fileHandle);
      return false;
     }

   FileClose(fileHandle);

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::AddText(string text)
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
     }

   FileSeek(fileHandle, 0, SEEK_END);
   if(!FileWrite(fileHandle, text))
     {
      FileClose(fileHandle);
      return false;
     }

   FileClose(fileHandle);

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CTextFile::Read()
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   string text = "";

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
     }

   text = FileReadString(fileHandle);

   FileClose(fileHandle);

   return text;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CTextFile::ReadLine(int lineNum)
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   string text = "";

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
     }

   for(int i = 0; i < lineNum; i++)
     {
      text = FileReadString(fileHandle);
     }


   FileClose(fileHandle);

   return text;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CTextFile::CountLines()
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   int lineCount = 0;

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
     }

   while(!FileIsEnding(fileHandle))
     {
      FileReadString(fileHandle);
      lineCount++;
     }

   FileClose(fileHandle);

   return lineCount;
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::DeleteLine(int lineNum)
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   int controller = 1;
   CTextFile tempFile;
   tempFile.Constructor(m_fileName + "_temp", m_filePath, m_inCommonFolder);

   while(controller <= CountLines())
     {
      if(controller != lineNum)
        {
         if(!tempFile.AddText(ReadLine(controller)))
           {
            return false;
           }
        }
      controller++;
     }

   FileClose(fileHandle);
   Delete();

   tempFile.Rename(m_fileName);

   Sleep(1000);

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CTextFile::GetLinePosition(string textToFind)
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   int lineCount = 1;
   int controller = 1;

   while(controller <= CountLines())
     {
      if(ReadLine(controller) == textToFind)
        {
         return lineCount;
        }
      lineCount++;
      controller++;
     }

   FileClose(fileHandle);

   return -1;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::Rename(string newName)
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   string newFullPath = m_filePath + newName + m_fileExtension;

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
      if(fileHandle == INVALID_HANDLE)
        {
         return false;
        }
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
      if(fileHandle == INVALID_HANDLE)
        {
         return false;
        }
     }

   FileClose(fileHandle);
   FileMove(fullPath,m_inCommonFolder,newFullPath,0);
   m_fileName = newName;

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::Move(string newPath, bool deleteFolder = false)
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   string newFullPath = newPath + m_fileName + m_fileExtension;

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
      if(fileHandle == INVALID_HANDLE)
        {
         return false;
        }
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
      if(fileHandle == INVALID_HANDLE)
        {
         return false;
        }
     }

   FileClose(fileHandle);
   FileMove(fullPath,m_inCommonFolder,newFullPath,0);

   Sleep(1000);

   if(deleteFolder)
     {
      FolderDelete(m_filePath);
     }

   m_filePath = newPath;

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::Delete()
  {
   string fullPath = m_filePath + m_fileName + m_fileExtension;

   if(m_inCommonFolder)
     {
      if(!FileDelete(fullPath, FILE_COMMON))
        {
         return false;
        }
     }
   else
     {
      if(!FileDelete(fullPath))
        {
         return false;
        }
     }

   return true;
  }
//+------------------------------------------------------------------+
