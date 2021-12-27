//
//  MBHUDTool.swift
//  Occlusion
//
//  Created by spec on 2021/12/25.
//

import Foundation

#if canImport(MBProgressHUD)
import MBProgressHUD
class MBHUDTool {
    var hud: MBProgressHUD?
//    var viewToPresentOn: UIView?
}

extension MBHUDTool: ProgressHUD {
    func showErr(onView view: UIView? = nil, title: String? = nil, subTitle: String? = nil) {
        if let hud = hud {
            hud.hide(animated: true)
        }
        hud = nil
        let view: UIView = view ?? UIApplication.shared.keyWindow!
        let h = MBProgressHUD.showAdded(to: view, animated: true)
        h.mode = .annularDeterminate
        let image = UIImage(named: "infomation")!
        image.withRenderingMode(.alwaysTemplate)
        h.customView = UIImageView(image: image)
        h.label.text = title
        h.detailsLabel.text = subTitle

        hud = h
    }

    public func dismiss() {
        guard let hud = hud else { return }
        hud.hide(animated: true)
    }

    func showLoading(onView view: UIView? = nil, title: String? = nil, subTitle: String? = nil) {
        if let hud = hud {
            hud.hide(animated: true)
        }
        hud = nil
        let view: UIView = view ?? UIApplication.shared.keyWindow!
        let h = MBProgressHUD.showAdded(to: view, animated: true)
        h.mode = .indeterminate
        h.label.text = title
        h.detailsLabel.text = subTitle

        hud = h
    }

    func showSuccess(onView view: UIView? = nil, title: String? = nil, subTitle: String? = nil) {
        if let hud = hud {
            hud.hide(animated: true)
        }
        hud = nil
        let view: UIView = view ?? UIApplication.shared.keyWindow!
        let h = MBProgressHUD.showAdded(to: view, animated: true)
        h.mode = .annularDeterminate
        let image = UIImage(named: "Checkmark")!
        image.withRenderingMode(.alwaysTemplate)
        h.customView = UIImageView(image: image)
        h.label.text = title
        h.detailsLabel.text = subTitle

        hud = h
    }

    func showInfo(onView view: UIView? = nil, title: String? = nil, subTitle: String? = nil) {
        if let hud = hud {
            hud.hide(animated: true)
        }
        hud = nil
        let view: UIView = view ?? UIApplication.shared.keyWindow!
        let h = MBProgressHUD.showAdded(to: view, animated: true)
        h.mode = .annularDeterminate
        let image = UIImage(named: "infomation")!
        image.withRenderingMode(.alwaysTemplate)
        h.customView = UIImageView(image: image)
        h.label.text = title
        h.detailsLabel.text = subTitle

        hud = h
    }
}
#endif
