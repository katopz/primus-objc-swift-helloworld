//
//  ViewController.swift
//  primus-obj-swift-helloworld
//
//  Created by katopz on 5/18/2558 BE.
//  Copyright (c) 2558 Debokeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func start() {
        
        let url = NSURL(string: "http://127.0.0.1:8080/primus")
        
        var options = PrimusConnectOptions()
        options.transformerClass = SocketRocketClient.classForCoder()
        options.timeout = 200
        options.manual = true
        
        let primus = Primus(URL: url, options:options)
        
        primus.on("open", listener : Block<@objc_block () -> ()> {
             NSLog("[open] - The connection has been established.");
        }.casted)
        
        primus.on("data", listener : Block<@objc_block (NSDictionary, AnyObject) -> ()> { (data: NSDictionary, raw: AnyObject) in
            NSLog("[data] - Received data: %@", data);
            
            let context: String = data["context"] as! String
            
            if context == "api" {
                if (data["welcome"] != nil) {
                    // {"event":"detailsView"}
                    primus.write(["event": "detailsView"]);
                 }
            }else if context == "response" {
                
                let messageCount: Int = data["messageCount"] as! Int
                
                if messageCount == 1 {
                    // {"event":"roomAdd","room":"defaultRoom"}
                    primus.write(["event": "roomAdd", "room": "defaultRoom"]);
                } else if messageCount == 2 {
                    // {"event":"say","room":"defaultRoom","message":"HelloWorld!"}
                    primus.write(["event": "say", "room": "defaultRoom", "message": "HelloWorld from Swift!"]);
                }
            }
        }.casted)
        
        primus.open()
    }
}

