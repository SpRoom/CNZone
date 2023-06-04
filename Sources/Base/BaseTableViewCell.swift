//
//  BaseTableViewCell.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/13.
//

import Foundation
import UIKit

open class BaseTableViewCell: UITableViewCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        basicStyle()
        setupStyle()
    }
 
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        basicStyle()
        setupStyle()
    }

}

extension BaseTableViewCell {
    @objc open func setupViews() {}
    @objc open func setupStyle() {}
}

extension BaseTableViewCell {
    func basicStyle() {
        selectionStyle = .none
    }
}
