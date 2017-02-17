# EpiLife
Designing and developing an iOS App in Swift that will receive and store data in the Google Cloud Platform and alerts the user and their relatives of incoming seizures due to epilepsy

## Project Design

### Wearable (Arduino Microcontroller)
- Collects data through sensors
- Reacts to incoming data
- Sends data to client through Bluetooth

### Client Interface (iOS) 
- Receives data from wearable
- Displays user-friendly data
- Stores data in Firebase
- Notifies victim's "circle" about epilepsy incidents
- Requests data from Firebase

### Google Cloud
- Handles authentication
- Host real-time database
