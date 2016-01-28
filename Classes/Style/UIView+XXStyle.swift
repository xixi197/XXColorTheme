//
//  UIView+XXColorCategory.swift
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

public enum XXTintColorButtonStyle {
    /// 仅图 normal: Light色 highlighted:Tint色 size:64
    case Middle(normalImage: UIImage)
    case MiddleHighlighted(normalImage: UIImage, highlightedImage: UIImage)
    case MiddleMark(normalImage: UIImage, highlightedImage: UIImage)
    /// 仅图 normal: Light色 highlighted:Light色 size:64 48
    case Light(normalImage: UIImage?)
    /// 图文字
    case Large(normalImage: UIImage)
    case LargeHighlighted(normalImage: UIImage, highlightedImage: UIImage)
    case LargeMark(normalImage: UIImage, highlightedImage: UIImage)
    /// 原图 文字Light
    case LargeColored(normalImage: UIImage)
}

public extension XXTintColorButton {
    func styled(style: XXTintColorButtonStyle) {
        switch style {
        case .Middle(let normalImage):
            xx_normalTemplateImage = normalImage
            xx_normalTintColorStyle = .Light
            xx_highlightedTintColorStyle = .Tint
        case .MiddleHighlighted(let normalImage, let highlightedImage):
            xx_normalTemplateImage = normalImage
            xx_highlightedTemplateImage = highlightedImage
            xx_normalTintColorStyle = .Light
            xx_highlightedTintColorStyle = .Tint
        case .MiddleMark(let normalImage, let highlightedImage):
            xx_normalTemplateImage = normalImage
            xx_highlightedTemplateImage = highlightedImage
            xx_normalTintColorStyle = .Light
            xx_selectedTintColorStyle = .Mark
        case .Light(let normalImage):
            xx_normalTemplateImage = normalImage
            xx_normalTintColorStyle = .Light3
            xx_highlightedTintColorStyle = .Light
        case .Large(let normalImage):
            xx_imageBorderWidth = 1
            xx_isTextDown = true
            styled(.Middle(normalImage: normalImage))
        case .LargeHighlighted(let normalImage, let highlightedImage):
            xx_imageBorderWidth = 1
            xx_isTextDown = true
            styled(.MiddleHighlighted(normalImage: normalImage, highlightedImage: highlightedImage))
        case .LargeMark(let normalImage, let highlightedImage):
            xx_imageBorderWidth = 1
            xx_isTextDown = true
            styled(.MiddleMark(normalImage: normalImage, highlightedImage: highlightedImage))
        case .LargeColored(let normalImage):
            xx_isTextDown = true
            setImage(normalImage, forState: .Normal)
        }
    }

//    func navgationRightTextButton() {
//        xx_colorStyle = .Tint
//        titleLabel?.font = titleLabel?.font.fontWithSize(XXFontSizeStyle.Headline.fontSize)
//    }
}
