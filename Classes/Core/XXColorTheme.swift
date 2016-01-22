//
//  XXColorTheme.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/15.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit
import RxSwift
import UIColor_Hex_Swift

public extension UIColor {
    class func randomColor() -> UIColor {
        return UIColor(hex6: UInt32(random() % 16777211))
    }
}

enum XXColorType {
    case Content
    case ContentBackground
    case Tint
    case Mark
    case Background
    case Random
}

public enum XXColorTheme: String {
    case Dark
    case Light
    case Custom

    static let currentTheme = Variable(XXColorTheme.Dark)

    func color(type: XXColorType) -> UIColor {
        switch self {
        case .Dark:
            switch type {
            case .Content:
                return UIColor.whiteColor()
            case .ContentBackground:
                return UIColor.blackColor()
            case .Tint:
                return UIColor(hex6: 0x00B9F2)
            case .Mark:
                return UIColor(hex6: 0xF44336)
            case .Background:
                return UIColor(hex6: 0x212121)
            case .Random:
                return UIColor.randomColor()
            }
        case .Light:
            switch type {
            case .Content:
                return UIColor.blackColor()
            case .ContentBackground:
                return UIColor.whiteColor()
            case .Tint:
                return UIColor(hex6: 0x00B9F2)
            case .Mark:
                return UIColor(hex6: 0xF44336)
            case .Background:
                return UIColor(hex6: 0xDEDEDE)
            case .Random:
                return UIColor.randomColor()
            }
        case .Custom:
            switch type {
            case .Content:
                return UIColor(hex6: 0xF44336)
            case .ContentBackground:
                return UIColor.blackColor()
            case .Tint:
                return UIColor(hex6: 0x00B9F2)
            case .Mark:
                return UIColor(hex6: 0xF44336)
            case .Background:
                return UIColor(hex6: 0xDEDEDE)
            case .Random:
                return UIColor.randomColor()
            }
        }
    }
}
