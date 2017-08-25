//
//  ViewController.swift
//  Tint
//
//  Created by Ken Myers on 2017/08/17.
//  Copyright © 2017 Ken Myers. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        NotificationCenter.default.post(name: .GlobalColorChangedNotification,
                                        object: NSColor(red: 1, green: 1, blue: 1, alpha: 1))
    }

    override var representedObject: Any? {
        didSet {

        }
    }
    
}

