# EpiLife
Designing and developing a RESTful API in Go that will send, store and analyze data in the Google Cloud Platform to alert the user and their relatives of incoming seizures due to epilepsy

## Project Design

### Wearable (Arduino Microcontroller)
- Collects data through sensors
- Reacts to incoming data
- Sends data to client through Bluetooth

### Client Interface (Raspberry Pi 3, Web, Mobile) 
- Receives data from wearable
- Displays user-friendly data
- POST data to Web Service
- GET analyzed data from Web Service

### Web Service (Built with Go)
- Sends data to client
- Sends data to Google Cloud
- Analyzes data

### Google Cloud Platform
- Hosts MongoDB
- Hosts API
- Hosts Web Client

## Tools & Resources
- <a href="https://apiblueprint.org/">API Blueprint</a> allows us quickly design our web service to follow an API-first strategy wihtout digging into any code
- <a href="https://cloud.google.com/">Google Cloud Platform</a> allows us to securely store our collected data as well as make our web service live for an easier transition to scale from the Raspberry Pi 3 client to Web and Mobile clients.
- <a href="https://github.com/karulis/pybluez">PyBluez</a> allows us to access the bluetooth receiver on the Raspberry Pi 3 to receive data from the Arduino microcontroller.
