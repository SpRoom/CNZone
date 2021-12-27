//
//  Int+Timepiece.swift
//  Timepiece
//
//  Created by Naoto Kaneko on 2014/08/15.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Foundation

extension Int {
    public var year: DateComponents {
        DateComponents(year: self)
    }

    public var years: DateComponents {
        year
    }

    public var month: DateComponents {
        DateComponents(month: self)
    }

    public var months: DateComponents {
        month
    }

    public var week: DateComponents {
        DateComponents(day: 7 * self)
    }

    public var weeks: DateComponents {
        week
    }

    public var day: DateComponents {
        DateComponents(day: self)
    }

    public var days: DateComponents {
        day
    }

    public var hour: DateComponents {
        DateComponents(hour: self)
    }

    public var hours: DateComponents {
        hour
    }

    public var minute: DateComponents {
        DateComponents(minute: self)
    }

    public var minutes: DateComponents {
        minute
    }

    public var second: DateComponents {
        DateComponents(second: self)
    }

    public var seconds: DateComponents {
        second
    }

    public var nanosecond: DateComponents {
        DateComponents(nanosecond: self)
    }

    public var nanoseconds: DateComponents {
        nanosecond
    }
}
