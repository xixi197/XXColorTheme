//
//  UIProgressView+XXColorStyle.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx

extension UIProgressView {
    private struct AssociatedKeys {
        static var ProgressTintColorStyle = "xx_progressTintColorStyle"
        static var TrackTintColorStyle = "xx_trackTintColorStyle"
    }

    var xx_progressTintColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.ProgressTintColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ProgressTintColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setProgressTintColor:")
        }
    }

    var xx_trackTintColorStyle: XXColorStyle? {
        get {
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.TrackTintColorStyle) as? String ?? ""
            return XXColorStyle(rawValue: lookup)
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.TrackTintColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            xx_addColorStyle(newValue, forSelector: "setTrackTintColor:")
        }
    }
}
