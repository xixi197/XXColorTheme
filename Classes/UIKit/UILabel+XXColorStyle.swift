//
//  UILabel+XXColorStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx

extension UILabel {
    private struct AssociatedKeys {
        static var TextColorStyle = "xx_textColorStyle"
        static var ShadowColorStyle = "xx_shadowColorStyle"
        static var HighlightedTextColorStyle = "xx_highlightedTextColorStyle"
        static var FontSizeStyle = "xx_fontSizeStyle"
    }

    var xx_textColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.TextColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.TextColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setTextColor:")
        }
    }

    var xx_shadowColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.ShadowColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ShadowColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setShadowColor:")
        }
    }

    var xx_highlightedTextColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.HighlightedTextColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.HighlightedTextColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setHighlightedTextColor:")
        }
    }

    var xx_fontSizeStyle: XXFontSizeStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.FontSizeStyle) as? String ?? ""
            return XXFontSizeStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.FontSizeStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addFontSizeStyle(newValue, forSelector: "setFontSize:")
        }
    }
}
