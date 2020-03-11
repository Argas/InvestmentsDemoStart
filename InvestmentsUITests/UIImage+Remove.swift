//
//  UIImage+Remove.swift
//  InvestmentsUITests
//
//  Created by finteh on 10.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation
import UIKit
import XCTest

extension UIImage {
    
    var removingStatusBar: UIImage? {
        guard let cgImage = cgImage else {
            return nil
        }
        
        var yOffset: CGFloat = 0
        if (!UIDevice.current.isXFamily) {
            yOffset = 22 * scale
        } else if (UIDevice.current.isIPhoneX) {
            yOffset = 44 * scale
        } else if (UIDevice.current.isIPhoneX_Max || UIDevice.current.isIPhoneXR) {
            yOffset = 48.6 * scale
        }
        let rect = CGRect(
            x: 0,
            y: Int(yOffset),
            width: cgImage.width,
            height: cgImage.height - Int(yOffset)
        )
        
        if let croppedCGImage = cgImage.cropping(to: rect) {
            return UIImage(cgImage: croppedCGImage, scale: scale, orientation: imageOrientation)
        }
        
        return nil
    }
    
    func fill(element: XCUIElement) -> UIImage {
        UIGraphicsBeginImageContext(self.size)
        self.draw(at: CGPoint.zero)
        let context = UIGraphicsGetCurrentContext()!
        context.fill(
            CGRect(
                x: element.frame.minX,
                y: element.frame.minY,
                width: element.frame.size.width,
                height: element.frame.size.height
            )
        )
        let myImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return myImage!
    }
}
