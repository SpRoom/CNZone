//
//  File.swift
//  
//
//  Created by spec on 2023/5/22.
//

import UIKit

public extension CZExtension where Base: UIView {
    
    // Set some or all corners radiuses of view.
    var cornerRadius: CGFloat {
        get {
            base.layer.cornerRadius
        }
        set {
            base.layer.masksToBounds = true
            base.layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    // Set some or all corners radiuses of view.
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
            let maskPath = UIBezierPath(
                roundedRect: base.bounds,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius))

            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            base.layer.mask = shape
        }
}
