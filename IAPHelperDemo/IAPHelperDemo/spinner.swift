//
//  spinner.swift
//  whatisit
//
//  Created by Jonas Tillges on 27.02.19.
//  Copyright © 2019 BEANT. All rights reserved.
//

import Foundation
import UIKit

class Spinner {
    
    
    //UI Indicator
    internal static var spinner: UIActivityIndicatorView?
    open static var style: UIActivityIndicatorView.Style = .whiteLarge
    open static var baseBackColor = UIColor(white: 0, alpha: 0.6)
    open static var baseColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)
    
    
    
    //UI Indicator
    // start spinning
    open static func start(style: UIActivityIndicatorView.Style = style, backColor: UIColor = baseBackColor, baseColor: UIColor = baseColor) {
        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            spinner = UIActivityIndicatorView(frame: frame)
            spinner!.backgroundColor = backColor
            spinner!.style = style
            spinner?.color = baseColor
            window.addSubview(spinner!)
            spinner?.layer.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.6).cgColor
            spinner!.startAnimating()
        }
    }
    
    //Stop spinning
    open static func stop() {
        if spinner != nil {
            spinner!.stopAnimating()
            spinner!.removeFromSuperview()
            spinner = nil
        }
    }
    //update
    open static func update() {
        if spinner != nil {
            stop()
            start()
        }
    }
    
    
}
