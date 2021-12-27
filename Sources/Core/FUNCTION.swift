//
//  FUNCTION.swift
//  SZLogisticsLiteVersion
//
//  Created by spectator Mr.Z on 2016/9/26.
//  Copyright © 2016年 spectator Mr.Z. All rights reserved.
//

import Foundation
import UIKit

/// MARK: - 获取当前根控制器
///
/// - Returns: 当前根VC
public func getCurrentVC() -> UIViewController {
    var result: UIViewController?

    var window = UIApplication.shared.keyWindow

    if window?.windowLevel != UIWindow.Level.normal {
        let windows = UIApplication.shared.windows

        for tmpWin in windows {
            if tmpWin.windowLevel == UIWindow.Level.normal {
                window = tmpWin
                break
            }
        }
    }

    let frontView = window?.subviews[0]
    let nextResponer = frontView?.next

    if (nextResponer?.isKind(of: UIViewController.self))! {
        result = nextResponer as! UIViewController?
    } else {
        result = window?.rootViewController
    }

    return result!
}

// MARK: - 字典转JSON

public func dic2Json(dictionary: [String: String]) {
    let result = dictionary.map {
        "\($0):\"\($1)\""
    }.joined(separator: ",")

    SNLog(result)
}

// MARK: - 模型转字典

public func modelToDic<T>(model: T) -> [String: String] {
    let aBookmark = model
    let aMirror = Mirror(reflecting: aBookmark)
    SNLog(aMirror.subjectType)

    var resultDic: [String: String] = [:]

    for p in aMirror.children {
        SNLog("label \(p.label!),value \(p.value)")

        let value = p.value as? String

        if value == "" {
            continue
        } else {
            resultDic[p.label!] = value
        }
    }

    return resultDic
}

// MARK: - 字典转JSON

public func dic2JSONStr(dictionary: [String: Any]) -> String {
    var jsonStr = ""
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)

        jsonStr = String(data: jsonData, encoding: .utf8)!

        SNLog(jsonStr)
    } catch let error as NSError {
        SNLog(error)
    }

    return jsonStr
}

// MARK: - String 转 Double

public func text2Doubel(_ text: String) -> Double {
    let n = NumberFormatter().number(from: text)
    if let num = n {
        let totalPrice = Double(truncating: num)
        return totalPrice
    } else {
        return 0.00
    }
}

// MARK: - String 转 Int

public func text2Int(_ text: String) -> Int {
    let n = NumberFormatter().number(from: text)
    if let num = n {
        let totalPrice = Int(truncating: num)
        return totalPrice
    } else {
        return 0
    }
}

// MARK: - String 转 CGFloat

public func text2CGFloat(_ text: String) -> CGFloat {
    let n = NumberFormatter().number(from: text)
    if let num = n {
        let totalPrice = CGFloat(truncating: num)
        return totalPrice
    } else {
        return 0.00
    }
}

// MARK: - 验证是否是数字

public func validNumber(text: String) -> Bool {
    let number = "^[0-9]+$"

    let numberPre = NSPredicate(format: "SELF MATCHES %@", number)

    let result = numberPre.evaluate(with: text)

    SNLog("string is number result: \(result)")

    return result
}

// MARK: - 验证是否都是大写

public func validCharacter(text: String) -> Bool {
    let character = "^[A-Z]+$"

    let characterPre = NSPredicate(format: "SELF MATCHES %@", character)

    let result = characterPre.evaluate(with: text)

    SNLog("string is character result: \(result)")

    return result
}

/// 拨打电话
///
/// - Parameter phone: 电话号码
public func callPhone(phone: String) {
    if #available(iOS 10.0, *) { // 10.3.1  10.3
        UIApplication.shared.open(URL(string: "telprompt://\(phone)")!, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)

    } else {
        UIApplication.shared.openURL(URL(string: "telprompt://\(phone)")!) // Fallback on earlier versions
    }
}

// Helper function inserted by Swift 4.2 migrator.
private func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value) })
}
