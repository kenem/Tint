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
        
        self.sliderAction(sender: redSlider!)

    }
    
    @IBAction func sliderAction(sender: NSSlider) {
        redFloatField?.floatValue = Float(redSlider!.integerValue) / 255.0
        greenFloatField?.floatValue = Float(greenSlider!.integerValue) / 255.0
        blueFloatField?.floatValue = Float(blueSlider!.integerValue) / 255.0
        
        redDecimalField?.integerValue = redSlider!.integerValue
        greenDecimalField?.integerValue = greenSlider!.integerValue
        blueDecimalField?.integerValue = blueSlider!.integerValue
    }
    
    func textDidChange(_ notification: Notification) {
        self.print("NOTI \(notification)")
    }
    
    @IBAction func decimalFieldAction(sender: NSTextField) {
        redSlider?.integerValue = redDecimalField!.integerValue
        blueSlider?.integerValue = greenDecimalField!.integerValue
        blueSlider?.integerValue = blueDecimalField!.integerValue
        
        redFloatField?.floatValue = Float(redDecimalField!.integerValue) / 255.0
        greenFloatField?.floatValue = Float(greenDecimalField!.integerValue) / 255.0
        blueFloatField?.floatValue = Float(blueDecimalField!.integerValue) / 255.0
    }
    
    @IBAction func floatFieldAction(sender: NSTextField) {
        redSlider?.integerValue = Int(redFloatField!.floatValue * 255.0)
        greenSlider?.integerValue = Int(greenFloatField!.floatValue * 255.0)
        blueSlider?.integerValue = Int(blueFloatField!.floatValue * 255.0)
        
        redDecimalField?.integerValue = Int(redFloatField!.floatValue * 255.0)
        greenDecimalField?.integerValue = Int(greenFloatField!.floatValue * 255.0)
        blueDecimalField?.integerValue = Int(blueFloatField!.floatValue * 255.0)
    }
    
    


}
