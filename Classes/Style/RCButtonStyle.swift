//
//  RCButtonStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

public enum RCButtonStyle {
    case MiddleNormal
    case MiddleTint

    case LargeNormal
    case LargeTint
}

public extension RCButton {
    convenience init(style: RCButtonStyle) {
        self.init(frame: CGRectZero)
        styled(style)
    }

    func styled(style: RCButtonStyle) {
        switch style {
        case .MiddleNormal:
            xx_borderWidth = 1
            xx_cornerRadius = 1
            xx_normalTintColorStyle = .Light
            xx_highlightedTintColorStyle = .Back
        case .MiddleTint:
            xx_borderWidth = 1
            xx_cornerRadius = 1
            xx_normalTintColorStyle = .Tint
            xx_highlightedTintColorStyle = .Back
        case .LargeNormal:
            xx_borderWidth = 1
            xx_cornerRadius = 2
            xx_normalTintColorStyle = .Light
            xx_highlightedTintColorStyle = .Back
        case .LargeTint:
            xx_borderWidth = 1
            xx_cornerRadius = 2
            xx_normalTintColorStyle = .Tint
            xx_highlightedTintColorStyle = .Back
        }
    }
}
