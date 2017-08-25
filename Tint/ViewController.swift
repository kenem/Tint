//
//  ViewController.swift
//  Tint
//
//  Created by Ken Myers on 2017/08/17.
//  Copyright © 2017 Ken Myers. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var redSlider: NSSlider?
    @IBOutlet var greenSlider: NSSlider?
    @IBOutlet var blueSlider: NSSlider?
    @IBOutlet var redFloatField: NSTextField?
    @IBOutlet var greenFloatField: NSTextField?
    @IBOutlet var blueFloatField: NSTextField?
    @IBOutlet var redDecimalField: NSTextField?
    @IBOutlet var greenDecimalField: NSTextField?
    @IBOutlet var blueDecimalField: NSTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    override var representedObject: Any? {
        didSet {

        }
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
        print("NOTI \(notification)")
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

