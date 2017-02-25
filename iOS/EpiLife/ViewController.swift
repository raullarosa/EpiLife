//
//  ViewController.swift
//  EpiLife
//
//  Created by Raul La Rosa on 2/16/17.
//  Copyright © 2017 EpiLife. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nrfManager: NRFManager!
    
    @IBOutlet var feedbackView: UITextView!
    @IBOutlet var connectButton: UIButton!
    @IBOutlet var disconnectButton: UIButton!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var scanButton: UIButton!
    @IBOutlet var currentPeripheralName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nrfManager = NRFManager(
            onConnect: {
                self.log("C: ★ Connected")
        },
            onDisconnect: {
                self.log("C: ★ Disconnected")
        },
            onData: {
                (data:Data?, string:String?)->() in
                self.log("C: ⬇ Received data - String: \(string) - Data: \(data)")
        },
            autoConnect: false
        )
        
        nrfManager.verbose = true
        nrfManager.delegate = self
        
        setupUI()
    }
    
    func sendData()
    {
        let string = "Whoot!"
        let result = self.nrfManager.writeString(string)
        log("⬆ Sent string: \(string) - Result: \(result)")
    }
    
    @IBAction func scanButtonTapped(_ sender: UIButton) {
        self.log("Scanning...")
        
        
    }
    
    @IBAction func connectButtonTapped(_ sender: Any) {
        nrfManager.connect("ArduinoUNO")
    }
}

// MARK: - NRFManagerDelegate Methods
extension ViewController: NRFManagerDelegate
{
    func nrfDidConnect(_ nrfManager:NRFManager)
    {
        self.log("D: ★ Connected")
    }
    
    func nrfDidDisconnect(_ nrfManager:NRFManager)
    {
        self.log("D: ★ Disconnected")
    }
    
    func nrfReceivedData(_ nrfManager:NRFManager, data: Data?, string: String?) {
        self.log("D: ⬇ Received data - String: \(string) - Data: \(data)")
    }
}

// MARK: - Various stuff
extension ViewController {
    func setupUI() {
        feedbackView.translatesAutoresizingMaskIntoConstraints = false
        feedbackView.layer.borderWidth = 1
        feedbackView.isEditable = false
        
        connectButton.translatesAutoresizingMaskIntoConstraints = false
//        connectButton.addTarget(nrfManager, action: Selector(("connect")), for: UIControlEvents.touchUpInside)
        
        disconnectButton.translatesAutoresizingMaskIntoConstraints = false
        disconnectButton.addTarget(nrfManager, action: Selector(("disconnect")), for: UIControlEvents.touchUpInside)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(ViewController.sendData), for: UIControlEvents.touchUpInside)
    }
    
    func log(_ string:String) {
        print(string)
        feedbackView.text = feedbackView.text + "\(string)\n"
        feedbackView.scrollRangeToVisible(NSMakeRange(feedbackView.text.characters.count , 1))
    }
    
}
