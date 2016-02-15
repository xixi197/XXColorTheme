//
//  UILabelStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

public enum UILabelStyle {
    case NavgationTitle

    case SectionTitle

    case CellTitle
    case CellSubTitle(ishighlighted: Bool)

    case SettingCellRightTitle//logout

    case PlaylistCellTitle
    case PlaylistCellSubTitle

    case PlayerEnTitle
    case PlayerCnTitle
    case PlayerCellTitle
    case PlayerCellSubTitle

    //fix
    case Notice// 提示文字，字体14，32%白，居中
    case SmallNotice// 最小的文字，字体12，32%白
}

public extension UILabel {
    convenience init(style: UILabelStyle) {
        self.init(frame: CGRectZero)
        styled(style)
    }

    func styled(style: UILabelStyle) {
        switch style {
        case .NavgationTitle:
            xx_textColorStyle = .Light
            xx_fontSizeStyle = .Title3
            textAlignment = .Center

        case .SectionTitle:
            xx_textColorStyle = .Light2
            xx_fontSizeStyle = .Caption1
        case .CellTitle:
            xx_textColorStyle = .Light
            xx_fontSizeStyle = .Headline
        case .CellSubTitle(let ishighlighted):
            xx_textColorStyle = ishighlighted ? .Light : .Light4
            xx_fontSizeStyle = .Subheadline

        case .SettingCellRightTitle:
            xx_textColorStyle = .Light2
            xx_fontSizeStyle = .Headline

        case .PlaylistCellTitle:
            xx_textColorStyle = .Light
            xx_fontSizeStyle = .Title3
            xx_backgroundColorStyle = .Dark
        case .PlaylistCellSubTitle:
            xx_textColorStyle = .Light2
            xx_fontSizeStyle = .Caption2
            xx_backgroundColorStyle = .Dark

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

        case .Notice:
            xx_textColorStyle = .Light4
            xx_fontSizeStyle = .Caption1
        case .SmallNotice:
            xx_textColorStyle = .Light4
            xx_fontSizeStyle = .Subheadline
        }
    }
}
