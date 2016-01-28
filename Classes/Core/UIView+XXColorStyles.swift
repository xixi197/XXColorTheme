//
//  UIView+XXColorStyles.swift
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
        static var ColorStyles = "xx_colorStyles"
    }

    private typealias Styles = [String: AnyObject] //selector : colorStyle

    private var xx_colorStyles: Styles {
        get {
            if let lookup = objc_getAssociatedObject(self, &AssociatedKeys.ColorStyles) as? Styles {
                return lookup
            } else {
                XXColorCategory.preferredColorCategory.asObservable().skip(1)
                    .subscribeNext { [weak self] _ -> Void in
                        self?.xx_updateColor()
                    }.addDisposableTo(self.rx_disposeBag)
                let styles: Styles = [:]
                self.xx_colorStyles = styles
                return styles
            }
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ColorStyles, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func xx_addColorStyle(colorStyle: XXColorStyle?, forSelector selector: String) {
        performSelector(Selector(selector), withObject: colorStyle?.color)
        xx_colorStyles[selector] = colorStyle?.rawValue
    }

    private func xx_updateColor() {
        for (selector, colorStyle) in xx_colorStyles {
            performSelector(Selector(selector), withObject: XXColorStyle(rawValue: colorStyle as! String)?.color)
        }
    }
}
