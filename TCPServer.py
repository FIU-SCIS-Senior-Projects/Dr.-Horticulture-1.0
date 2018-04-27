#!/usr/bin/env python

import socket
from imageProcessing import getIndexFromImage
import _thread

def getResponse(request):

    value = round(0.0,4)

    length = len(str(value))

    print(indexOfHeader)

    print ("200")

    response = "HTTP/1.1 200 OK\r\nContent-Length:" + str(length) + "\r\nContent-Type:text/html\r\nConnection: Closed\r\n\r\n" + str(value)

    return response

def on_new_client(clientsocket,addr):
        while True:
            msg = clientsocket.recv(2048) 
            print (addr, ' >> ', msg)
            msg = getResponse(msg)
            clientsocket.sendall(msg.encode('utf-8')) 
            #conn.sendall(response.encode('utf-8'))
        clientsocket.shutdown(1)
        clientsocket.close()

def startServer():

    TCP_IP = '127.0.0.1'
    TCP_PORT = 50010
    BUFFER_SIZE = 2048  # Normally 1024, but we want fast response

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind((TCP_IP, TCP_PORT))
    s.listen(1)   
    
    while 1:
        conn, addr = s.accept()
        print ("Connection address:", addr)
        _thread.start_new_thread(on_new_client,(conn,addr))
        #data = conn.recv(BUFFER_SIZE)
        #if not data:
        #   conn.close()
        #   break          
        #print ("received data:", data)
        #response = getResponse(data)
        #conn.sendall(response.encode('utf-8'))  # echo
        #conn.close()  
        
    s.close()

startServer()

print("Hello")