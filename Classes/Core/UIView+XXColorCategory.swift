//
//  UIView+XXColorCategory.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx

extension UIView {
    private struct AssociatedKeys {
        static var ColorViewStyle = "xx_colorViewStyle"
    }

    var xx_colorViewStyle: XXColorViewStyle? {
        get {
            var colorViewStyle: XXColorViewStyle?
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.ColorViewStyle) as? String
            if let lookup = lookup {
                colorViewStyle = XXColorViewStyle(rawValue: lookup)
            }

            return colorViewStyle
        }

        set {
            let oldValue = self.xx_colorViewStyle
            if oldValue == newValue { return }
            objc_setAssociatedObject(self, &AssociatedKeys.ColorViewStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if oldValue == nil && newValue != nil {
                XXColorCategory.preferredColorCategory.asObservable().subscribeNext { [weak self] _ -> Void in
                    self?.xx_updateColor()
                    }.addDisposableTo(self.rx_disposeBag)
            }
        }
    }

    private func xx_updateColor() {
        if let dictionary = xx_colorViewStyle?.dictionary {
            for (selector, color) in dictionary {
                let sel = Selector(selector)
                performSelector(sel, withObject: color)
            }
        }
    }
}
