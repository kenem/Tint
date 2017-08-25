//
//  RGBView.swift
//  Tint
//
//  Created by Ken Myers on 2017/08/25.
//  Copyright © 2017 Aspire. All rights reserved.
//

import Cocoa

class RGBView: NSView {
    
    @IBOutlet weak var redSlider: NSSlider?
    @IBOutlet weak var greenSlider: NSSlider?
    @IBOutlet weak var blueSlider: NSSlider?
    @IBOutlet weak var redFloatField: NSTextField?
    @IBOutlet weak var greenFloatField: NSTextField?
    @IBOutlet weak var blueFloatField: NSTextField?
    @IBOutlet weak var redDecimalField: NSTextField?
    @IBOutlet weak var greenDecimalField: NSTextField?
    @IBOutlet weak var blueDecimalField: NSTextField?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let floatFormatter = NumberFormatter()
        floatFormatter.minimumIntegerDigits = 1
        floatFormatter.minimumIntegerDigits = 1
        floatFormatter.minimumFractionDigits = 3
        floatFormatter.maximumFractionDigits = 3
        redFloatField?.cell?.formatter = floatFormatter
        greenFloatField?.cell?.formatter = floatFormatter
        blueFloatField?.cell?.formatter = floatFormatter
        
        let intFormatter = NumberFormatter()
        intFormatter.minimumIntegerDigits = 1
        redDecimalField?.cell?.formatter = intFormatter
        greenDecimalField?.cell?.formatter = intFormatter
        blueDecimalField?.cell?.formatter = intFormatter
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateColors(notification:)),
                                               name: .GlobalColorChangedNotification,
                                               object: nil)
        
        self.sliderAction(sender: redSlider!)

    }
    
    @IBAction func sliderAction(sender: NSSlider) {
        let newColor = NSColor(red: CGFloat((redSlider?.integerValue)!) / 255.0,
                               green: CGFloat((greenSlider?.integerValue)!) / 255.0,
                               blue: CGFloat((blueSlider?.integerValue)!) / 255.0, alpha: 1)
        NotificationCenter.default.post(name: .GlobalColorChangedNotification, object: newColor)
    }
    
    func textDidChange(_ notification: Notification) {
        self.print("NOTI \(notification)")
    }
    
    func updateColors(notification: Notification) {
        if let color = notification.object as? NSColor {
            redSlider?.integerValue = Int(color.redComponent * 255.0)
            greenSlider?.integerValue = Int(color.greenComponent * 255.0)
            blueSlider?.integerValue = Int(color.blueComponent * 255.0)
            
            redDecimalField?.integerValue = Int(color.redComponent * 255.0)
            greenDecimalField?.integerValue = Int(color.greenComponent * 255.0)
            blueDecimalField?.integerValue = Int(color.blueComponent * 255.0)
            
            redFloatField?.floatValue = Float(color.redComponent)
            greenFloatField?.floatValue = Float(color.greenComponent)
            blueFloatField?.floatValue = Float(color.blueComponent)
        }
    }
    
    @IBAction func decimalFieldAction(sender: NSTextField) {
        let newColor = NSColor(red: CGFloat((redDecimalField?.integerValue)!) / 255.0,
                               green: CGFloat((greenDecimalField?.integerValue)!) / 255.0,
                               blue: CGFloat((blueDecimalField?.integerValue)!) / 255.0, alpha: 1)
        NotificationCenter.default.post(name: .GlobalColorChangedNotification, object: newColor)
    }
    
    @IBAction func floatFieldAction(sender: NSTextField) {
        let newColor = NSColor(red: CGFloat(redFloatField!.floatValue),
                               green: CGFloat(greenFloatField!.floatValue),
                               blue: CGFloat(blueFloatField!.floatValue), alpha: 1)
        NotificationCenter.default.post(name: .GlobalColorChangedNotification, object: newColor)
    }
    
    


}
