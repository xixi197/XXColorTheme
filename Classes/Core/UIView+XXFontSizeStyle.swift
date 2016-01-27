//
//  UIView+XXFontSizeStyle.swift
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
        static var FontSizeStyle = "xx_fontSizeStyle"
    }

    var xx_fontSizeStyle: XXFontSizeStyle? {
        get {
            var fontSizeStyle: XXFontSizeStyle?
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.FontSizeStyle) as? String
            if let lookup = lookup {
                fontSizeStyle = XXFontSizeStyle(rawValue: lookup)
            }

            return fontSizeStyle
        }

        set {
            let oldValue = self.xx_fontSizeStyle
            if oldValue == newValue { return }
            objc_setAssociatedObject(self, &AssociatedKeys.FontSizeStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if oldValue == nil && newValue != nil {
                XXFontSizeCategory.preferredFontSizeCategory.asObservable()
                    .subscribeNext { [weak self] _ -> Void in
                        self?.xx_updateFontSize()
                    }.addDisposableTo(self.rx_disposeBag)
            }
        }
    }

    private func xx_updateFontSize() {
        guard let style = xx_fontSizeStyle else { return }
        if self.respondsToSelector("getFont") {
            let f_fontSize = XXFontSizeCategory.preferredFontSizeCategory.value.fontSize
            let fontSize = f_fontSize(style)

            let font = performSelector("getFont").takeRetainedValue() as! UIFont
            performSelector("setFont:", withObject: font.fontWithSize(fontSize))
        }
    }
}
