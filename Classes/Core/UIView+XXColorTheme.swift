//
//  UIView+XXColorTheme.swift
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
        static var ColorViewType = "xx_colorViewType"
    }

    private func doLocked(closure: () -> Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        closure()
    }

    var xx_colorViewType: XXColorViewType? {
        get {
            var colorViewType: XXColorViewType?
            doLocked {
                let lookup = objc_getAssociatedObject(self, &AssociatedKeys.ColorViewType) as? String
                if let lookup = lookup {
                    colorViewType = XXColorViewType(rawValue: lookup)
                }
            }
            return colorViewType
        }

        set {
            doLocked {
                let oldValue = self.xx_colorViewType
                if oldValue == newValue { return }
                objc_setAssociatedObject(self, &AssociatedKeys.ColorViewType, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

                if oldValue == nil && newValue != nil {
                    XXColorTheme.currentTheme.asObservable().subscribeNext { [weak self] _ -> Void in
                        self?.xx_updateColor()
                        }.addDisposableTo(self.rx_disposeBag)
                } else if oldValue != nil && newValue == nil {
                    self.rx_disposeBag = DisposeBag()
                }
            }
        }
    }

    private func xx_updateColor() {
        if let dictionary = self.xx_colorViewType?.dictionary {
            for (selector, color) in dictionary {
                let sel = Selector(selector)
                self.performSelector(sel, withObject: color)
            }
        }
    }
}
