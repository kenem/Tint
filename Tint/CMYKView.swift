//
//  CMYKView.swift
//  Tint
//
//  Created by Ken Myers on 2017/08/25.
//  Copyright © 2017 Aspire. All rights reserved.
//

import Cocoa

class CMYKView: NSView {
    
    @IBOutlet weak var cSlider: NSSlider?
    @IBOutlet weak var mSlider: NSSlider?
    @IBOutlet weak var ySlider: NSSlider?
    @IBOutlet weak var kSlider: NSSlider?
    @IBOutlet weak var cField: NSTextField?
    @IBOutlet weak var mField: NSTextField?
    @IBOutlet weak var yField: NSTextField?
    @IBOutlet weak var kField: NSTextField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let percentFormatter = NumberFormatter()
        percentFormatter.positiveSuffix = "%"
        cField?.cell?.formatter = percentFormatter
        mField?.cell?.formatter = percentFormatter
        yField?.cell?.formatter = percentFormatter
        kField?.cell?.formatter = percentFormatter
    }
    
    @IBAction func sliderAction(sender: NSSlider) {
        let newColor = NSColor(deviceCyan: CGFloat((cSlider?.floatValue)!),
                               magenta: CGFloat((mSlider?.floatValue)!),
                               yellow: CGFloat((ySlider?.floatValue)!),
                               black: CGFloat((kSlider?.floatValue)!), alpha: 1)
        NotificationCenter.default.post(name: .GlobalColorChangedNotification, object: newColor)
    }
    
    func textDidChange(_ notification: Notification) {
        self.print("NOTI \(notification)")
    }
    
    func updateColors(notification: Notification) {
        if let color = notification.object as? NSColor {
            cSlider?.integerValue = Int(color.cyanComponent * 100.0)
            mSlider?.integerValue = Int(color.magentaComponent * 100.0)
            ySlider?.integerValue = Int(color.yellowComponent * 100.0)
            kSlider?.integerValue = Int(color.blackComponent * 100.0)
            
            cField?.integerValue = Int(color.cyanComponent * 100.0)
            mField?.integerValue = Int(color.magentaComponent * 100.0)
            yField?.integerValue = Int(color.yellowComponent * 100.0)
            kField?.integerValue = Int(color.blackComponent * 100.0)
        }
    }
    
    @IBAction func fieldAction(sender: NSTextField) {
        let newColor = NSColor(deviceCyan: CGFloat((cField?.integerValue)!) / 100.0,
                               magenta: CGFloat((mField?.integerValue)!) / 100.0,
                               yellow: CGFloat((yField?.integerValue)!) / 100.0,
                               black: CGFloat((kField?.integerValue)!) / 100.0, alpha: 1)
        NotificationCenter.default.post(name: .GlobalColorChangedNotification, object: newColor)
    }


}
