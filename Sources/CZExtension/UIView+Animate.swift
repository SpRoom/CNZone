//
//  UIView+Animate.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import Foundation
import UIKit

extension CZExtension where Base: UIView {
    /// SwifterSwift: Fade in view.
    ///
    /// - Parameters:
    ///   - duration: animation duration in seconds (default is 1 second).
    ///   - completion: optional completion handler to run with animation finishes (default is nil).
    func fadeIn(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        if base.isHidden {
            base.isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.base.alpha = 1
        }, completion: completion)
    }

    /// SwifterSwift: Fade out view.
    ///
    /// - Parameters:
    ///   - duration: animation duration in seconds (default is 1 second).
    ///   - completion: optional completion handler to run with animation finishes (default is nil).
    func fadeOut(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        if base.isHidden {
            base.isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.base.alpha = 0
        }, completion: completion)
    }
}

extension UIView {
    /// Rotate
    ///
    func rotate(duration: CFTimeInterval, angle: Double = Double.pi * 2, repeat: Float = .greatestFiniteMagnitude) {
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: angle)
        rotation.duration = duration
        rotation.isCumulative = true
        rotation.repeatCount = `repeat`
        rotation.isRemovedOnCompletion = false
        layer.add(rotation, forKey: "rotationAnimation")
    }
}
