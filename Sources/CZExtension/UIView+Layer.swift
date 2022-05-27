//
//  UIView+Layer.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import UIKit

// MARK: Shadow

extension CZExtension where Base: UIView {
    /// SwifterSwift: Shadow color of view; also inspectable from Storyboard.
    var shadowColor: UIColor? {
        get {
            guard let color = base.layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            base.layer.shadowColor = newValue?.cgColor
        }
    }

    /// SwifterSwift: Shadow offset of view; also inspectable from Storyboard.
    var shadowOffset: CGSize {
        get {
            base.layer.shadowOffset
        }
        set {
            base.layer.shadowOffset = newValue
        }
    }

    /// SwifterSwift: Shadow opacity of view; also inspectable from Storyboard.
    var layerShadowOpacity: Float {
        get {
            base.layer.shadowOpacity
        }
        set {
            base.layer.shadowOpacity = newValue
        }
    }

    /// SwifterSwift: Shadow radius of view; also inspectable from Storyboard.
    var shadowRadius: CGFloat {
        get {
            base.layer.shadowRadius
        }
        set {
            base.layer.shadowRadius = newValue
        }
    }

    /// SwifterSwift: Masks to bounds of view; also inspectable from Storyboard.
    var masksToBounds: Bool {
        get {
            base.layer.masksToBounds
        }
        set {
            base.layer.masksToBounds = newValue
        }
    }
}
/*
extension CZExtension where Base: UIView {
    /// circle view
    public func corner(with: CGFloat, coners: UIRectCorner, file: String = #file, function: String = #function, line: Int = #line) {
        guard let sup = base.superview else {
            SNLog("corner failed, the reason is can't find superview", file: file, function: function, line: line)
            return
        }
        // if use snapkit, need update frame
        sup.layoutIfNeeded()

        let maskPath = UIBezierPath(roundedRect: base.bounds, byRoundingCorners: coners, cornerRadii: CGSize(width: with, height: with))

        let maskLayer = CAShapeLayer()
        maskLayer.frame = base.bounds
        maskLayer.path = maskPath.cgPath
        base.layer.mask = maskLayer
    }
}

extension CZExtension where Base: UIView {
    /// 画虚线，调用之前请确保能获取到frame
    /// 如果有多个calayer在当前空间 会使其他layer失效
    /// - Parameters:
    ///   - lineLength: 每一节线长
    ///   - lineSpacing: 间距
    ///   - lineColor: 颜色
    ///   - isHorizontal: 是否水平
    public func drawDashLine(lineLength: Int, lineSpacing: Int, lineColor: UIColor, isHorizontal: Bool = true) {
        if let sublayers = base.layer.sublayers {
            for sublayer in sublayers {
                sublayer.removeFromSuperlayer()
            }
        }
        //        self.layer.sublayers = nil

        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = base.bounds
        //        只要是CALayer这种类型,他的anchorPoint默认都是(0.5,0.5)
        shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
        //        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = lineColor.cgColor

        //        shapeLayer.lineWidth = self.frame.size.height
        //        shapeLayer.lineJoin = CAShapeLayerLineJoin.round

        shapeLayer.lineDashPattern = [NSNumber(value: lineLength), NSNumber(value: lineSpacing)]

        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        if isHorizontal {
            path.addLine(to: CGPoint(x: base.frame.size.width, y: 0))
        } else {
            path.addLine(to: CGPoint(x: 0, y: base.frame.size.height))
        }
        shapeLayer.path = path
        base.layer.addSublayer(shapeLayer)
    }
}
*/
extension CZExtension where Base: UIView {
    public func addShadow(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        base.layer.shadowColor = color.cgColor
        base.layer.shadowOffset = offset
        base.layer.shadowOpacity = opacity
        base.layer.shadowRadius = radius
        base.layer.masksToBounds = false
    }
}

extension CZExtension where Base: UIView {
    /// 试图 缩放动画
    /// - Parameter scaleMax: 放大比例  原始1
    /// - Parameter scaleMin: 缩小比例  原始1
    /// - Parameter count: 缩放次数
    public func zoom(scaleMax: CGFloat, scaleMin: CGFloat, count: Int) {
        let maxTrans = CGAffineTransform(scaleX: scaleMax, y: scaleMax)
        let minTrans = CGAffineTransform(scaleX: scaleMin, y: scaleMin)

        base.transform = minTrans

        zoomAnimation(minTrans: minTrans, maxTrans: maxTrans, maxCount: count)
    }

    private func zoomAnimation(minTrans: CGAffineTransform, maxTrans: CGAffineTransform, maxCount: Int, currentCount: Int = 1) {
        let animtionDuration: TimeInterval = 0.6
        let completionDuration: TimeInterval = 0.3

        UIView.animate(withDuration: animtionDuration, animations: { [weak self] in
            guard let self = self else { return }
            self.base.transform = maxTrans
        }, completion: { _ in
            UIView.animate(withDuration: animtionDuration, animations: { [weak self] in
                guard let self = self else { return }
                self.base.transform = minTrans
            }, completion: { [weak self] _ in
                let newCurrent = currentCount + 1
                if newCurrent <= maxCount {
                    self?.base.cz.zoomAnimation(minTrans: minTrans, maxTrans: maxTrans, maxCount: maxCount, currentCount: newCurrent)
                } else {
                    UIView.animate(withDuration: completionDuration, animations: {
                        self?.base.transform = CGAffineTransform(scaleX: 1, y: 1)
                    })
                }
            })
        })
    }
}
