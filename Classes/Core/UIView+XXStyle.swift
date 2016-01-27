//
//  UIView+XXColorCategory.swift
//  XXcolorCategory
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

public enum XXViewStyle {
    case Back
    case DarkBack
    case NavgationSep
    case cellSep
}

public extension UIView {
    func styled(style: XXViewStyle) {
        switch style {
        case .Back:
            xx_colorStyle = .Back
        case .DarkBack:
            xx_colorStyle = .Dark
        case .NavgationSep:
            xx_colorStyle = .Light5
        case .cellSep:
            xx_colorStyle = .Light6
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
            xx_colorStyle = .Light
            xx_fontSizeStyle = .Title3
        case .CellTitle:
            xx_colorStyle = .Light
            xx_fontSizeStyle = .Headline
        case .CellSubTitle(let ishighlighted):
            xx_colorStyle = ishighlighted ? .Light : .Light4
            xx_fontSizeStyle = .Subheadline
        case .CellTitle2:
            xx_colorStyle = .Light2
            xx_fontSizeStyle = .Headline
        case .PlayerEnTitle:
            xx_colorStyle = .Light
            xx_fontSizeStyle = .Title2
        case .PlayerCnTitle:
            xx_colorStyle = .Light
            xx_fontSizeStyle = .Caption2
        case .PlayerCellTitle:
            xx_colorStyle = .Light
            xx_fontSizeStyle = .Title2
        case .PlayerCellSubTitle:
            xx_colorStyle = .Light
            xx_fontSizeStyle = .Headline
        }
    }
}

public enum XXImageViewStyle {
    case LeftDrawer
}

public extension UIImageView {
    func styled(style: XXImageViewStyle) {
        switch style {
        case .LeftDrawer:
            xx_colorStyle = .Light4
        }
    }
}

public enum XXTintColorButtonStyle {
    /// 仅图 normal: Light色 highlighted:Tint色 size:64
    case Middle(normalImage: UIImage)
    case MiddleHighlighted(normalImage: UIImage, highlightedImage: UIImage)
    case MiddleMark(normalImage: UIImage, highlightedImage: UIImage)
    /// 仅图 normal: Light色 highlighted:Light色 size:64 48
    case Light(normalImage: UIImage)
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
            xx_colorStyle = .Light
        case .MiddleHighlighted(let normalImage, let highlightedImage):
            xx_normalTemplateImage = normalImage
            xx_highlightedTemplateImage = highlightedImage
            xx_colorStyle = .Light
        case .MiddleMark(let normalImage, let highlightedImage):
            xx_normalTemplateImage = normalImage
            xx_highlightedTemplateImage = highlightedImage
            xx_colorStyle = .Mark
        case .Light(let normalImage):
            xx_normalTemplateImage = normalImage
            xx_colorStyle = .Light3
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

    func navgationRightTextButton() {
        xx_colorStyle = .Tint
        titleLabel?.font = titleLabel?.font.fontWithSize(XXFontSizeStyle.Headline.fontSize)
    }
}
