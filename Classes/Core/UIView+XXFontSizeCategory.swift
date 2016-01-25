//
//  UIView+XXFontSizeCategory.swift
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
        static var FontTextStyle = "xx_fontTextStyle"
    }

    var xx_fontTextStyle: XXFontTextStyle? {
        get {
            var fontTextStyle: XXFontTextStyle?
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys.FontTextStyle) as? String
            if let lookup = lookup {
                fontTextStyle = XXFontTextStyle(rawValue: lookup)
            }

            return fontTextStyle
        }

        set {
            let oldValue = self.xx_fontTextStyle
            if oldValue == newValue { return }
            objc_setAssociatedObject(self, &AssociatedKeys.FontTextStyle, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if oldValue == nil && newValue != nil {
                XXFontSizeCategory.preferredFontSizeCategory.asObservable().subscribeNext { [weak self] _ -> Void in
                    self?.xx_updateFont()
                    }.addDisposableTo(self.rx_disposeBag)
            }
        }
    }

    private func xx_updateFont() {
        if let fontTextStyle = xx_fontTextStyle {
            if self.respondsToSelector("getFont") {
                let font = performSelector("getFont").takeRetainedValue() as! UIFont
                let fontSize = XXFontSizeCategory.preferredFontSizeCategory.value.fontSize(fontTextStyle)
                performSelector("setFont:", withObject: font.fontWithSize(fontSize))
            }
        }
    }
}
