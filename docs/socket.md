# ClientSocket & ServerSocket
These classes allows you to open clients and servers sockets using DLLs.

### Table of content
- [ClientSocket \& ServerSocket](#clientsocket--serversocket)
    - [Table of content](#table-of-content)
- [Installation](#installation)
    - [Installation of a socket for client](#installation-of-a-socket-for-client)
- [Usage](#usage)
  - [Check if the socket is still connected](#check-if-the-socket-is-still-connected)
  - [Sending information](#sending-information)
  - [Closing the socket](#closing-the-socket)
    - [For Client](#for-client)
- [Sockets for server](#sockets-for-server)
    - [Notes](#notes)

# Installation
1. **You need to call the framework in the beginning of your script, see the main [README](../README.md) file for more information.**
2. Allow DLLs import in your project.
3. Make a new `class object` of the `ServerSocket` or `ClientSocket` class using the following code:

### Installation of a socket for client
```cpp
ClientSocket * clientSocket = NULL;

int OnInit()
{
    //Check if the socket is not already created
    if(!clientSocket)
    {
        clientSocket = new ClientSocket(<host>, <port>); //Using only the port as parameter will make the class use the localhost.
    }

    //Check if the socket is connected
    if(clientSocket.IsSocketConnected == true)
    {
        //Actions with the socket like sending or receiving data.
    }
    else
    {
        delete clientSocket;
        clientSocket = NULL;
    }

    return INIT_SUCCEEDED;
}
```

# Usage
## Check if the socket is still connected
```cpp
if(clientSocket.IsSocketConnected())
{
    //Socket is connected
}
```

## Sending information
```cpp
clientSocket.Send(<message_string> + "\n");
```

## Closing the socket
You must close the sockets while leaving the EA in your `OnDeinit()` function. Use: <br>

### For Client
```cpp
if (clientSocket) 
{
      delete clientSocket;
      clientSocket = NULL;
}
```

# Sockets for server
In order to see the usage for opening a server socket, click [here](https://www.mql5.com/en/blogs/post/706665). <br>

### Notes
This library is being edited for an easiest way to use the sockets for the server side. That is the reason why I do not include the documentation for the server and redirect you to the official release.