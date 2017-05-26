# EpiLife
Designed a mobile interface in Sketch for an app that will transfer data from the wearable and alert the user and their relatives of incoming seizures due to epilepsy

## Project Design

### Wearable (Arduino Microcontroller)
- Collects data through sensors
- Reacts to incoming data
- Sends data to client through Bluetooth

### Client Interface (iOS) 
- Receives data from wearable
- Displays user-friendly data such as: Heart rate, stress levels, motion, electrical activity in the brain and muscles
- Stores data in Firebase
- Notifies victim's "circle" about epilepsy incidents
- Requests data from Firebase

### Google Cloud
- Handles authentication
- Host real-time database
