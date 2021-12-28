//
//  NetConfig.swift
//  
//
//  Created by spec on 2021/12/28.
//

import Foundation

public class NetConfig {
    
    public static let shared = NetConfig()
    
    var reloginHandler: (() -> Void)?
    
    var reloginCode: String = "1002"
    
    public func config(reloginCode: String) {
        self.reloginCode = reloginCode
    }
    
    public func setRelogin(handler: @escaping (() -> Void)) {
        reloginHandler = handler
    }
}
