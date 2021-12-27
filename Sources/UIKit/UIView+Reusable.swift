//
//  UIView+Reusable.swift
//  Occlusion
//
//  Created by spec on 2021/12/11.
//

import Foundation
import UIKit

public protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}

extension UIViewController: ReusableView {}
