//
//  UIView+Extension.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/7.
//

import Foundation
import UIKit

public extension CZExtension where Base: UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { base.addSubview($0) }
    }

    /// SwifterSwift: Remove all subviews in view.
    func removeSubviews() {
        base.subviews.forEach { $0.removeFromSuperview() }
    }

    /// SwifterSwift: Returns all the subviews of a given type recursively in the
    /// view hierarchy rooted on the view it its called.
    ///
    /// - Parameter ofType: Class of the view to search.
    /// - Returns: All subviews with a specified type.
    func subviews<T>(ofType _: T.Type) -> [T] {
        var views = [T]()
        for subview in base.subviews {
            if let view = subview as? T {
                views.append(view)
            } else if !subview.subviews.isEmpty {
                views.append(contentsOf: subview.cz.subviews(ofType: T.self))
            }
        }
        return views
    }
}

public extension CZExtension where Base: UIView {
    /// SwifterSwift: Remove all gesture recognizers from view.
    func removeGestureRecognizers() {
        base.gestureRecognizers?.forEach { ges in
            base.removeGestureRecognizer(ges)
        }
    }

    /// SwifterSwift: Attaches gesture recognizers to the view. Attaching gesture recognizers to a view defines the scope of the represented gesture, causing it to receive touches hit-tested to that view and all of its subviews. The view establishes a strong reference to the gesture recognizers.
    ///
    /// - Parameter gestureRecognizers: The array of gesture recognizers to be added to the view.
    func addGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        for recognizer in gestureRecognizers {
            base.addGestureRecognizer(recognizer)
        }
    }

    /// SwifterSwift: Detaches gesture recognizers from the receiving view. This method releases gestureRecognizers in addition to detaching them from the view.
    ///
    /// - Parameter gestureRecognizers: The array of gesture recognizers to be removed from the view.
    func removeGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        for recognizer in gestureRecognizers {
            base.removeGestureRecognizer(recognizer)
        }
    }
}
