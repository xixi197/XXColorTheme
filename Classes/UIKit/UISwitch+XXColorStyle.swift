//
//  UISwitch+XXColorStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx

extension UISwitch {
    private struct AssociatedKeys {
        static var OnTintColorStyle = "xx_onTintColorStyle"
        static var ThumbTintColorStyle = "xx_thumbTintColorStyle"
    }

    var xx_onTintColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.OnTintColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.OnTintColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setOnTintColor:")
        }
    }

    var xx_thumbTintColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.ThumbTintColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ThumbTintColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setThumbTintColor:")
        }
    }
}
