//
//  UIView+XXFontSizeStyles.swift
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
        static var FontSizeStyles = "xx_fontSizeStyles"
    }

    private typealias Styles = [String: AnyObject] //selector : colorStyle

    private var xx_fontSizeStyle: Styles {
        get {
            if let lookup = objc_getAssociatedObject(self, &AssociatedKeys.FontSizeStyles) as? Styles {
                return lookup
            } else {
                XXFontSizeCategory.preferredFontSizeCategory.asObservable().skip(1)
                    .subscribeNext { [weak self] _ -> Void in
                        self?.xx_updateFontSize()
                    }.addDisposableTo(self.rx_disposeBag)
                let styles: Styles = [:]
                self.xx_fontSizeStyle = styles
                return styles
            }
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.FontSizeStyles, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func xx_addFontSizeStyle(fontSizeStyle: XXFontSizeStyle?, forSelector selector: String) {
        performSelector(Selector(selector), withObject: fontSizeStyle?.fontSize)
        xx_fontSizeStyle[selector] = fontSizeStyle?.rawValue
    }

    private func xx_updateFontSize() {
        for (selector, fontSizeStyle) in xx_fontSizeStyle {
            performSelector(Selector(selector), withObject: XXFontSizeStyle(rawValue: fontSizeStyle as! String)?.fontSize)
        }
    }

    var fontSize: CGFloat {
        get {
            if respondsToSelector("getFont") {
                let font = performSelector("getFont").takeRetainedValue() as! UIFont
                return font.pointSize
            } else {
                return 0
            }
        }

        set {
            if respondsToSelector("getFont") {
                let font = performSelector("getFont").takeRetainedValue() as! UIFont
                performSelector("setFont:", withObject: font.fontWithSize(newValue))
            }
        }
    }
}
