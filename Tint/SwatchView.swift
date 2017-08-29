//
//  SwatchView.swift
//  Tint
//
//  Created by Ken Myers on 2017/08/25.
//  Copyright © 2017 Aspire. All rights reserved.
//

import Cocoa

class SwatchView: NSView {
    
    @IBOutlet weak var colorSwatch: NSView?
    @IBOutlet weak var hexRGBField: NSTextField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateColors(notification:)),
                                               name: .GlobalColorChangedNotification,
                                               object: nil)
    }

    func updateColors(notification: Notification) {
        if let color = notification.object as? NSColor {
            colorSwatch?.layer?.backgroundColor = color.cgColor
            hexRGBField?.cell?.stringValue = String(format: "%02X%02X%02X",
                                                    Int(color.redComponent * 255.0),
                                                    Int(color.greenComponent * 255.0),
                                                    Int(color.blueComponent * 255.0))
        }
    }
    
    @IBAction func fieldAction(sender: NSTextField) {
        if let rgbValue = UInt64((hexRGBField?.cell?.stringValue)!, radix:16) {
            let r = CGFloat((rgbValue & 0xff0000) >> 16) / 255.0
            let g = CGFloat((rgbValue & 0x00ff00) >> 8) / 255.0
            let b = CGFloat(rgbValue & 0x0000ff) / 255.0
            let newColor = NSColor(red: r, green: g, blue: b, alpha: 1)
            
            NotificationCenter.default.post(name: .GlobalColorChangedNotification, object: newColor)
        }
    }
}
