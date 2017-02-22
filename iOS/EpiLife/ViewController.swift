//
//  ViewController.swift
//  EpiLife
//
//  Created by Raul La Rosa on 2/16/17.
//  Copyright © 2017 EpiLife. All rights reserved.
//

import UIKit

private class ViewController: UIViewController, NRFManagerDelegate {

    var nrfManager:NRFManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nrfManager = NRFManager(delegate:self)
    }
    
    func sendData(){
        let result = self.nrfManager.writeString("Data Sent: Hello World!")
    }

    
    // NRFManagaerDelgate methods
    func nrfDidConnect(_ nrfManager: NRFManager) {
        print("D: ★ Connected")
        self.sendData()
    }
    
    func nrfDidDisconnect(_ nrfManager: NRFManager) {
        print("D: ★ Connected")
    }
    
    func nrfReceivedData(_ nrfManager: NRFManager, data: Data?, string: String?) {
        print("D: ⬇ Received data - String: \(string) - Data: \(data)")
    }
    
    
    @IBAction func connectBtn(_ sender: UIButton) {
        
        print("Connect pressed")
    }
    
    @IBAction func disconnectBtn(_ sender: UIButton) {
        
        print("Disconnect pressed")
    }
}

