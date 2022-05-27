//
//  UIView+DashDraw.swift
//  Occlusion
//
//  Created by spec on 2022/05/28.
//

import Foundation
import UIKit

public extension CZExtension where Base: UIView {
    
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

    public func drawDashBorder(length _: CGFloat, width: CGFloat, spacing _: CGFloat, color _: UIColor) {
        guard base.frame != .zero else { return }

        let topLine = CAShapeLayer()
        let leftLine = CAShapeLayer()
        let rightLine = CAShapeLayer()
        let bottomLine = CAShapeLayer()

        topLine.bounds = CGRect(x: 0, y: 0, width: base.frame.width, height: width)
        leftLine.bounds = CGRect(x: 0, y: 0, width: width, height: base.frame.height)
        rightLine.bounds = CGRect(x: 0, y: 0, width: width, height: base.frame.height)
        bottomLine.bounds = CGRect(x: 0, y: 0, width: base.frame.width, height: width)
    }

    public func drawBoardBottedLine(width: CGFloat, length: CGFloat, space: CGFloat, radius: CGFloat, color: UIColor) {
        base.layer.cornerRadius = radius
        let borderLayer = CAShapeLayer()
        borderLayer.bounds = base.bounds

        borderLayer.position = CGPoint(x: base.bounds.midX, y: base.bounds.midY)
        borderLayer.path = UIBezierPath(roundedRect: borderLayer.bounds, cornerRadius: radius).cgPath
        borderLayer.lineWidth = width / UIScreen.main.scale

        borderLayer.lineDashPattern = [length, space] as [NSNumber]
        borderLayer.lineDashPhase = 0.1

        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = color.cgColor

        base.layer.addSublayer(borderLayer)
    }
}