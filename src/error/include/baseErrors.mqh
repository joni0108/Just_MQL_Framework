string _FrameworkErr(int error)
{
    string description;

    switch (error)
    {
    case 0:   description="no error";                                                                                  break;
    case 20001:   description="Line out of range (File.ReadLine()|File.DeleteLine())";                                                    break;
    
    default:   description="unknown error";
    }
    
    return description;
}