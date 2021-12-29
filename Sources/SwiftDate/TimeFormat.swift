//
//  TimeFormat.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/4.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation
import SwiftDate

public extension Int {
    
    /// 毫秒级时间戳格式化
    ///
    /// - Parameter format: format 格式
    /// - Returns: 格式化后的字符串
    func millisecondsToStr(_ format: String = "HH:mm:ss", zone: Zones = Zones.gmt) -> String {
        let china = Region(calendar: Calendars.gregorian, zone: zone, locale: Locales.georgian)
        let date = DateInRegion(milliseconds: self, region: china)
        return date.toFormat(format)
    }
    
    func millisecondsTimeString() -> String {
        let totalSec = self/1000
        let seconds = totalSec % 60
            let minutes = totalSec / 60 % 60
            let hours = totalSec / 3600
        return String(format: "%.2d:%.2d:%.2d", hours, minutes, seconds)
    }
    
    /// 毫秒级时间戳格式化
    ///
    /// - Parameter format: format 格式
    /// - Returns: 格式化后的字符串
    func millisecondsToString(_ format: String = "HH:mm:ss") -> String {
        let china = Region(calendar: Calendars.gregorian, zone: Zones.asiaShanghai, locale: Locales.chinese)
        let date = DateInRegion(milliseconds: self, region: china)
        return date.toFormat(format)
    }
    
    ///  秒级时间戳格式化
    ///
    /// - Parameter format: format 格式
    /// - Returns: 格式化后的字符串
    func secondsToString(_ format: String = "HH:mm:ss") -> String {
        let china = Region(calendar: Calendars.gregorian, zone: Zones.asiaShanghai, locale: Locales.chinese)
        let date = DateInRegion(seconds: TimeInterval(self), region: china)
        return date.toFormat(format)
    }
    
    /// 秒级时间戳格式化 （系统时区）
    /// - Parameter format: 格式化后的字符串
    func countDownHourMinuteSecondString() -> String {
        
        let date = DateInRegion(seconds: TimeInterval(self))
//        return date.toFormat(format)
        return String(format: "%02d:%02d:%02d", date.hour,
                              date.minute,
                              date.second)
    }
    func countDownMinuteSecondString() -> String {
        
        let date = DateInRegion(seconds: TimeInterval(self))
        return String(format: "%02d:%02d",
                              date.minute+(date.hour * 60),
                              date.second)
    }
    
    func secondRegion() -> DateInRegion {
        return DateInRegion(seconds: TimeInterval(self))
    }
    
    func millisecondsRegion() -> DateInRegion {
        return DateInRegion(milliseconds: self)
    }
}


public extension TimeInterval {
    
    ///  秒级时间戳格式化
    ///
    /// - Parameter format: format 格式
    /// - Returns: 格式化后的字符串
    func toTimeString(_ format: String = "HH:mm:ss") -> String {
        let china = Region(calendar: Calendars.gregorian, zone: Zones.asiaShanghai, locale: Locales.chinese)
        let date = DateInRegion(seconds: self, region: china)
        return date.toFormat(format)
    }
}


func gcdSecondsCountDown(endTime: Int, format: String = "HH:mm:ss", action: @escaping (String, Int, Bool)->()) -> DispatchSourceTimer {
    
    var endTime = endTime
    let timer = DispatchSource.makeTimerSource(flags: .init(rawValue: 0), queue: DispatchQueue.global())
    timer.schedule(deadline: .now(), repeating: .milliseconds(1000))
    
    timer.setEventHandler {
        let timestr = endTime.countDownHourMinuteSecondString()
        action(timestr, endTime, endTime <= 0)
        endTime -= 1
    }
    
    timer.resume()
    
    return timer
}

func gcdCountDown(endTime: Int, repeatMilliseconds: Int = 1000, action: @escaping (Int)->()) -> DispatchSourceTimer {
    
    var endTime = endTime
    let timer = DispatchSource.makeTimerSource(flags: .init(rawValue: 0), queue: DispatchQueue.global())
    timer.schedule(deadline: .now(), repeating: .milliseconds(repeatMilliseconds))
    
    timer.setEventHandler {
        
        action(endTime)
        endTime -= repeatMilliseconds
    }
    
    timer.resume()
    
    return timer
}
