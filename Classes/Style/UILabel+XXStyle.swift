//
//  UIView+XXStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

public enum XXLabelStyle {
    case NavgationTitle
    case CellTitle
    case CellSubTitle(ishighlighted: Bool)
    case CellTitle2
    case PlayerEnTitle
    case PlayerCnTitle
    case PlayerCellTitle
    case PlayerCellSubTitle
}

public extension UILabel {
    func styled(style: XXLabelStyle) {
        switch style {
        case .NavgationTitle:
            xx_textColorStyle = .Light
            xx_fontSizeStyle = .Title3
        case .CellTitle:
            xx_textColorStyle = .Light
            xx_fontSizeStyle = .Headline
        case .CellSubTitle(let ishighlighted):
            xx_textColorStyle = ishighlighted ? .Light : .Light4
            xx_fontSizeStyle = .Subheadline
        case .CellTitle2:
            xx_textColorStyle = .Light2
            xx_fontSizeStyle = .Headline
        case .PlayerEnTitle:
            xx_textColorStyle = .Light
            xx_fontSizeStyle = .Title2
        case .PlayerCnTitle:
            xx_textColorStyle = .Light
            xx_fontSizeStyle = .Caption2
        case .PlayerCellTitle:
            xx_textColorStyle = .Light
            xx_fontSizeStyle = .Title2
        case .PlayerCellSubTitle:
            xx_textColorStyle = .Light
            xx_fontSizeStyle = .Headline
        }
    }
}
