//
//  XXTintColorButton+XXColorStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx

extension XXTintColorButton {
    private struct AssociatedKeys {
        static var NormalTintColorStyle = "xx_normalTintColorStyle"
        static var HighlightedTintColorStyle = "xx_highlightedTintColorStyle"
        static var SelectedTintColorStyle = "xx_selectedTintColorStyle"
    }

    var xx_normalTintColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.NormalTintColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.NormalTintColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setXx_normalTintColor:")
        }
    }

    var xx_highlightedTintColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.HighlightedTintColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.HighlightedTintColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setXx_highlightedTintColor:")
        }
    }

    var xx_selectedTintColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.SelectedTintColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.SelectedTintColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setXx_selectedTintColor:")
        }
    }
}
