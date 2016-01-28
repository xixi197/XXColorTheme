//
//  UIPageControl+XXColorStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx

extension UIPageControl {
    private struct AssociatedKeys {
        static var PageIndicatorTintColorStyle = "xx_pageIndicatorTintColorStyle"
        static var CurrentPageIndicatorTintColorStyle = "xx_currentPageIndicatorTintColorStyle"
    }

    var xx_pageIndicatorTintColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.PageIndicatorTintColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.PageIndicatorTintColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setPageIndicatorTintColor:")
        }
    }

    var xx_currentPageIndicatorTintColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.CurrentPageIndicatorTintColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.CurrentPageIndicatorTintColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setCurrentPageIndicatorTintColor:")
        }
    }
}
