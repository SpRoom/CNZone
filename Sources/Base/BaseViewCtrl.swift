//
//  BaseViewCtrl.swift
//  Occlusion
//
//  Created by Spec on 2021/12/6.
//

import RxSwift
import UIKit

class BaseCtrl: UIViewController {
    fileprivate var onceToken = false

    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupStyle()
        setupBind()
        loadData()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            // Fallback on earlier versions
            return .default
        }
    }

    func setupStyle() {}
    func setupViews() {}
    func setupBind() {}
    func loadData() {}

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        SNLog("\(self) is deinit")
    }
}

class BaseViewCtrl: BaseCtrl {
    let basicScrView = UIScrollView()
    let contentView = UIView()

    override func viewDidLoad() {
        baseConfig()
        super.viewDidLoad()
    }
}

extension BaseViewCtrl {
    func onceLoad(_ block: () -> Void) {
        if !onceToken {
            onceToken = true
            block()
        }
    }
}

extension BaseViewCtrl {
    func baseConfig() {
        view.backgroundColor = .white

        basicScrView.contentSize = CGSize(width: ScreenW, height: 0)
        view.addSubview(basicScrView)
        basicScrView.addSubview(contentView)

        basicScrView.showsHorizontalScrollIndicator = false
        basicScrView.showsVerticalScrollIndicator = false
        basicScrView.bounces = false

        basicScrView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalTo(view)
        }
    }
}
