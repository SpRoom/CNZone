//
//  BaseViewCtrl.swift
//  Occlusion
//
//  Created by Spec on 2021/12/6.
//

import RxSwift
import UIKit

open class BaseCtrl: UIViewController {
    fileprivate var onceToken = false

    public let disposeBag = DisposeBag()
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupStyle()
        setupBind()
        loadData()
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            // Fallback on earlier versions
            return .default
        }
    }

    

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
 
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    
    }

    deinit {
        SNLog("\(self) is deinit")
    }
}



extension BaseCtrl {
    @objc open func setupStyle() {}
    @objc open func setupViews() {}
    @objc open func setupBind() {}
    @objc open func loadData() {}
}

open class BaseViewCtrl: BaseCtrl {
    public let basicScrView = UIScrollView()
    public let contentView = UIView()

    open override func viewDidLoad() {
        baseConfig()
        super.viewDidLoad()
    }
}

extension BaseViewCtrl {
    public func onceLoad(_ block: () -> Void) {
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
