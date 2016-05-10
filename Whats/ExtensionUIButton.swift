//
//  ExtensionUIButton.swift
//  Whats
//
//  Created by Martreux Steven on 09/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), color.CGColor)
        CGContextFillRect(UIGraphicsGetCurrentContext(), CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, forState: forState)
    }
    
    func setCornerBorder(borderWitdth : CGFloat, borderColor : UIColor, cornerRadius : CGFloat)
    {
        self.layer.borderWidth = borderWitdth
        self.layer.borderColor = borderColor.CGColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
        
    func centImageAndTitle(padding: CGFloat = 20.0) {
        let imageSize = self.imageView!.frame.size
        let titleSize = self.titleLabel!.frame.size
        let totalHeight = imageSize.height + titleSize.height + padding
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageSize.height),
            left: 0,
            bottom: 0,
            right: -titleSize.width
        )
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageSize.width,
            bottom: -(totalHeight - titleSize.height),
            right: 0
        )
    }

}