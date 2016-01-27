//
//  UIView+XXColorStyle.swift
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
        static var ColorStyle = "xx_colorStyle"
    }

    var xx_colorStyle: XXColorStyle? {
        get {
            var colorStyle: XXColorStyle?
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.ColorStyle) as? String
            if let lookup = lookup {
                colorStyle = XXColorStyle(rawValue: lookup)
            }

            return colorStyle
        }

        set {
            let oldValue = self.xx_colorStyle
            if oldValue == newValue { return }
            objc_setAssociatedObject(self, &AssociatedKeys.ColorStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if oldValue == nil && newValue != nil {
                XXColorCategory.preferredColorCategory.asObservable()
                    .subscribeNext { [weak self] _ -> Void in
                        self?.xx_updateColor()
                    }.addDisposableTo(self.rx_disposeBag)
            }
        }
    }

    private func xx_updateColor() {
        if let colorSelectors = xx_colorSelectors {
            for (string, color) in colorSelectors {
                performSelector(Selector(string), withObject: color)
            }
        }
    }
}
