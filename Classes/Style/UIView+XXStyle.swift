//
//  UIView+XXStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

public enum XXViewStyle {
    case Back
    case TintBack
    case DarkBack
    case ClearBack

    case NavigationSep

    case CellSep
}

public extension UIView {
    func styled(style: XXViewStyle) {
        switch style {
        case .Back:
            xx_backgroundColorStyle = .Back
        case .TintBack:
            xx_backgroundColorStyle = .Tint
        case .DarkBack:
            xx_backgroundColorStyle = .Dark
        case .ClearBack:
            xx_backgroundColorStyle = .Clear

        case .NavigationSep:
            xx_backgroundColorStyle = .Light5

        case .CellSep:
            xx_backgroundColorStyle = .Light6
        }
    }
}

public enum XXImageViewStyle {
    case Light
    case Tint
    case LeftDrawer
}

public extension UIImageView {
    func styled(style: XXImageViewStyle) {
        switch style {
        case .Light:
            xx_tintColorStyle = .Light
        case .Tint:
            xx_tintColorStyle = .Tint
        case .LeftDrawer:
            xx_tintColorStyle = .Light4
        }
    }
}
