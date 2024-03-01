import socket
import json

# creating socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(('localhost', 5555))
server_socket.listen(1)

# accept incoming connections
client_socket, address = server_socket.accept()


# process messages
while True:
    data = client_socket.recv(1024).decode('utf-8')

    if not data:
        break

    message = json.loads(data)

    print("Received ", message) 

    response = { 'result': message['value'] * 2 }
    client_socket.send(json.dumps(response).encode('utf-8'))

client_socket.close() 

