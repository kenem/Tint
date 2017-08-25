//
//  HSBView.swift
//  Tint
//
//  Created by Ken Myers on 2017/08/25.
//  Copyright © 2017 Aspire. All rights reserved.
//

import Cocoa

class HSBView: NSView {
    
    @IBOutlet weak var hSlider: NSSlider?
    @IBOutlet weak var sSlider: NSSlider?
    @IBOutlet weak var bSlider: NSSlider?
    @IBOutlet weak var hDegreesField: NSTextField?
    @IBOutlet weak var sPercentField: NSTextField?
    @IBOutlet weak var bPercentField: NSTextField?
    @IBOutlet weak var hFractionField: NSTextField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let degreesFormatter = NumberFormatter()
        degreesFormatter.positiveSuffix = "º"
        hDegreesField?.cell?.formatter = degreesFormatter
        
        let percentFormatter = NumberFormatter()
        percentFormatter.positiveSuffix = "%"
        sPercentField?.cell?.formatter = percentFormatter
        bPercentField?.cell?.formatter = percentFormatter
        
        let floatFormatter = NumberFormatter()
        floatFormatter.minimumIntegerDigits = 1
        floatFormatter.minimumIntegerDigits = 1
        floatFormatter.minimumFractionDigits = 3
        floatFormatter.maximumFractionDigits = 3
        hFractionField?.cell?.formatter = floatFormatter
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateColors(notification:)),
                                               name: .GlobalColorChangedNotification,
                                               object: nil)
    }
    
    @IBAction func sliderAction(sender: NSSlider) {
        let newColor = NSColor(hue: CGFloat(hSlider!.integerValue) / 360.0,
                               saturation: CGFloat(sSlider!.integerValue) / 100.0,
                               brightness: CGFloat(bSlider!.integerValue) / 100.0,
                               alpha: 1)
        NotificationCenter.default.post(name: .GlobalColorChangedNotification, object: newColor)
    }
    
    func textDidChange(_ notification: Notification) {
        self.print("NOTI \(notification)")
    }
    
    func updateColors(notification: Notification) {
        if let color = notification.object as? NSColor {
            hSlider?.integerValue = Int(color.hueComponent * 360.0)
            sSlider?.integerValue = Int(color.saturationComponent * 100.0)
            bSlider?.integerValue = Int(color.brightnessComponent * 100.0)
            
            hDegreesField?.integerValue = Int(color.hueComponent * 360.0)
            sPercentField?.integerValue = Int(color.saturationComponent * 100.0)
            bPercentField?.integerValue = Int(color.brightnessComponent * 100.0)
            
            hFractionField?.floatValue = Float(color.hueComponent)
        }
    }
    
    @IBAction func decimalFieldAction(sender: NSTextField) {
        let newColor = NSColor(hue: CGFloat(hDegreesField!.integerValue) / 360.0,
                               saturation: CGFloat(sPercentField!.integerValue) / 100.0,
                               brightness: CGFloat(bPercentField!.integerValue) / 100.0,
                               alpha: 1)
        NotificationCenter.default.post(name: .GlobalColorChangedNotification, object: newColor)
    }

    @IBAction func fractionFieldAction(sender: NSTextField) {
        let newColor = NSColor(hue: CGFloat(hFractionField!.floatValue),
                               saturation: CGFloat(sPercentField!.integerValue) / 100.0,
                               brightness: CGFloat(bPercentField!.integerValue) / 100.0,
                               alpha: 1)
        NotificationCenter.default.post(name: .GlobalColorChangedNotification, object: newColor)
    }

    
}
