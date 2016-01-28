//
//  UIView+XXStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

public enum XXViewStyle {
    case Tint
    case Back
    case DarkBack
    case NavgationSep
    case CellSep
    case Clear
}

public extension UIView {
    func styled(style: XXViewStyle) {
        switch style {
        case .Tint:
            xx_backgroundColorStyle = .Tint
        case .Back:
            xx_backgroundColorStyle = .Back
        case .DarkBack:
            xx_backgroundColorStyle = .Dark
        case .NavgationSep:
            xx_backgroundColorStyle = .Light5
        case .CellSep:
            xx_backgroundColorStyle = .Light6
        case .Clear:
            xx_backgroundColorStyle = .Clear
        }
    }
}

public enum XXImageViewStyle {
    case Default
    case Tint
    case LeftDrawer
}

public extension UIImageView {
    func styled(style: XXImageViewStyle) {
        switch style {
        case .Default:
            xx_tintColorStyle = .Light
        case .Tint:
            xx_tintColorStyle = .Tint
        case .LeftDrawer:
            xx_tintColorStyle = .Light4
        }
    }
}
