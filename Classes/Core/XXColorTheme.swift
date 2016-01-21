//
//  XXColorTheme.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/15.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit
import RxSwift

enum XXColorViewType: String {
    case DefaultXXTintColorButton

    var dictionary: [String: UIColor] {
        let colorTheme = XXColorTheme.currentTheme
        switch self {
        case DefaultXXTintColorButton:
            return [
                "setXx_normalTintColor:": colorTheme.value.color(.Main),
                "setXx_highlightedTintColor:": colorTheme.value.color(.Tint)]
        }
    }
}

enum XXColorType {
    case Main
    case Tint
}

public enum XXColorTheme {
    case Light
    case Dark
    case Custom

    static let currentTheme = Variable(XXColorTheme.Dark)

    func color(type: XXColorType) -> UIColor {
        switch self {
        case .Light:
            switch type {
            case .Main:
                return UIColor.blackColor()
            case .Tint:
                return UIColor.blueColor()
            }
        case .Dark:
            switch type {
            case .Main:
                return UIColor.whiteColor()
            case .Tint:
                return UIColor.blueColor()
            }
        case .Custom:
            switch type {
            case .Main:
                return UIColor.greenColor()
            case .Tint:
                return UIColor.redColor()
            }
        }
    }
}
