//
//  SnapKit+Ex.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import SnapKit
import UIKit

extension ConstraintMakerEditable {
    @discardableResult
    public func snOffset(_ amount: CGFloat) -> SnapKit.ConstraintMakerEditable {
        offset(amount.fit)
        return self
    }

    @discardableResult
    public func snInset(_ amount: CGFloat) -> SnapKit.ConstraintMakerEditable {
        inset(amount.fit)
        return self
    }
}

extension ConstraintMakerRelatable {
    @discardableResult
    public func snEqualTo(_ other: ConstraintRelatableTarget, _ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
        if let other = other as? ConstraintConstantTarget {
            let value = CGFloat(truncating: other as! NSNumber)
            return equalTo(value.fit, file, line)
        } else {
            return equalTo(other, file, line)
        }
    }

    @discardableResult
    public func snEqualToSuperview(_ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        equalToSuperview(file, line)
    }

    @discardableResult
    public func snTopSuperview(vc: UIViewController, _ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        if #available(iOS 11, *) {
            return self.equalTo(vc.view.safeAreaLayoutGuide.snp.top)
        } else {
            return equalTo(vc.topLayoutGuide.snp.bottom)
        }
    }

    @discardableResult
    public func snTopLessThanSuperview(vc: UIViewController, _ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        if #available(iOS 11, *) {
            return self.lessThanOrEqualTo(vc.view.safeAreaLayoutGuide.snp.top)
        } else {
            return lessThanOrEqualTo(vc.topLayoutGuide.snp.bottom)
        }
    }

    @discardableResult
    public func snTopGreaterThanSuperview(vc: UIViewController, _ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        if #available(iOS 11, *) {
            return self.greaterThanOrEqualTo(vc.view.safeAreaLayoutGuide.snp.top)
        } else {
            return greaterThanOrEqualTo(vc.topLayoutGuide.snp.bottom)
        }
    }

    @discardableResult
    public func snBottomSuperview(vc: UIViewController, _ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        if #available(iOS 11, *) {
            return self.equalTo(vc.view.safeAreaLayoutGuide.snp.bottom)
        } else {
            return equalTo(vc.bottomLayoutGuide.snp.top)
        }
    }

    @discardableResult
    public func snBottomLessThanSuperview(vc: UIViewController, _ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        if #available(iOS 11, *) {
            return self.lessThanOrEqualTo(vc.view.safeAreaLayoutGuide.snp.bottom)
        } else {
            return lessThanOrEqualTo(vc.bottomLayoutGuide.snp.top)
        }
    }

    @discardableResult
    public func snBottomGreaterThanSuperview(vc: UIViewController, _ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        if #available(iOS 11, *) {
            return self.greaterThanOrEqualTo(vc.view.safeAreaLayoutGuide.snp.bottom)
        } else {
            return greaterThanOrEqualTo(vc.bottomLayoutGuide.snp.top)
        }
    }
}

extension ConstraintMaker {
    public func positionCenterY() {
        centerY.snEqualToSuperview()
    }

    public func positionCenterX() {
        centerX.snEqualToSuperview()
    }

    public func center() {
        center.snEqualToSuperview()
    }

    @discardableResult
    public func height(_ height: CGFloat) -> SnapKit.ConstraintMakerEditable {
        self.height.snEqualTo(height)
    }

    @discardableResult
    public func width(_ width: CGFloat) -> SnapKit.ConstraintMakerEditable {
        self.width.snEqualTo(width)
    }

    public func size(_ width: ConstraintRelatableTarget, _ height: ConstraintRelatableTarget) {
        self.width.snEqualTo(width)
        self.height.snEqualTo(height)
    }

    public func position(left: CGFloat? = nil, top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil) {
        if let target = top {
            self.top.snEqualToSuperview().snOffset(target)
        }
        if let target = left {
            self.left.snEqualToSuperview().snOffset(target)
        }
        if let target = right {
            self.right.snEqualToSuperview().snOffset(target)
        }
        if let target = bottom {
            self.bottom.snEqualToSuperview().snOffset(target)
        }
    }
}
