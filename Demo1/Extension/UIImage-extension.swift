//
//  UiImage-extension.swift
//  Demo1
//
//  Created by 58 on 2021/6/15.
//

import Foundation
import UIKit

extension UIImage {
    func from(tintColor: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0)
        tintColor.setFill()
        let bounds = CGRect.init(origin: CGPoint.zero, size: self.size)
        UIRectFill(bounds)
        self.draw(in: bounds, blendMode: .destinationIn, alpha: 1)
        
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tintedImage
    }
}
