//
//  TCButtonStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

public enum TCButtonStyle {
    /// 仅图 normal: Light色 highlighted: Light色 size: 48
    case SmallLightNormal(normalImage: UIImage)

    /// 仅图 normal: Light色 highlighted: Tint色 size: 64
    case MiddleNormal(normalImage: UIImage)
    case MiddleHighlighted(normalImage: UIImage, highlightedImage: UIImage)
    case MiddleMark(normalImage: UIImage, highlightedImage: UIImage)

    /// 图文字
    case LargeNormal(normalImage: UIImage)
    case LargeHighlighted(normalImage: UIImage, highlightedImage: UIImage)
    case LargeMark(normalImage: UIImage, highlightedImage: UIImage)
    /// 原图 文字Light
    case LargeColoredNormal(normalImage: UIImage)

    /// 不带边框 纯文字
    case TextLight
    case TextTint
}

public extension TCButton {
    convenience init(style: TCButtonStyle) {
        self.init(frame: CGRectZero)
        styled(style)
    }

    func styled(style: TCButtonStyle) {
        switch style {
        case .SmallLightNormal(let normalImage):
            xx_normalTemplateImage = normalImage
            xx_normalTintColorStyle = .Light3
            xx_highlightedTintColorStyle = .Light

        case .MiddleNormal(let normalImage):
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

        case .LargeNormal(let normalImage):
            xx_imageBorderWidth = 1
            xx_isTextDown = true
            styled(.MiddleNormal(normalImage: normalImage))
        case .LargeHighlighted(let normalImage, let highlightedImage):
            xx_imageBorderWidth = 1
            xx_isTextDown = true
            styled(.MiddleHighlighted(normalImage: normalImage, highlightedImage: highlightedImage))
        case .LargeMark(let normalImage, let highlightedImage):
            xx_imageBorderWidth = 1
            xx_isTextDown = true
            styled(.MiddleMark(normalImage: normalImage, highlightedImage: highlightedImage))

        case .LargeColoredNormal(let normalImage):
            xx_isTextDown = true
            setImage(normalImage, forState: .Normal)

        case .TextLight:
            xx_normalTintColorStyle = .Light
            xx_highlightedTintColorStyle = .Tint
            titleLabel?.xx_fontSizeStyle = .Headline
        case .TextTint:
            xx_normalTintColorStyle = .Tint
            titleLabel?.xx_fontSizeStyle = .Headline
        }
    }
}
