//
//  BaseTableViewCell.swift
//  Occlusion
//
//  Created by 楠 on 2021/12/13.
//

import Foundation
import UIKit

public class BaseTableViewCell: UITableViewCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        basicStyle()
        setupStyle()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupViews() {}
    public func setupStyle() {}
}

extension BaseTableViewCell {
    func basicStyle() {
        selectionStyle = .none
    }
}
