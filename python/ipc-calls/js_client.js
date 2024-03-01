const net = require('net') 

const client = new net.Socket()

client.connect(5555, 'localhost', () => {
    const message = { value: 2024 }
    client.write(JSON.stringify(message))
})


client.on('data', data => {
    const response = JSON.parse(data)
    console.log('Received: ', response)
    client.destroy()
})

