//
//  UIView+XXColorCategory.swift
//  XXcolorCategory
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

extension UIView {
    var xx_colorSelectors: [String: UIColor]? {
        guard let style = xx_colorStyle else { return nil }
        let f_color = XXColorCategory.preferredColorCategory.value.color
        let color = f_color(style)

        if self is UILabel {
            return ["setTextColor:" : color]
        } else if self is UIImageView {
            return ["setTintColor:" : color]
        } else if self is UIButton {
            if self is XXTintColorButton {
                switch style {
                case .Light:
                    return [
                        "setXx_normalTintColor:" : color,
                        "setXx_highlightedTintColor:" : f_color(.Tint)]
                case .Light2, .Light3, .Light4, .Light5, .Light6:
                    return [
                        "setXx_normalTintColor:" : color,
                        "setXx_highlightedTintColor:" : f_color(.Light)]
                case .Tint:
                    return [
                        "setXx_normalTintColor:" : color,
                        "setXx_highlightedTintColor:" : color.colorWithAlphaComponent(0.48)]
                case .Mark:
                    return [
                        "setXx_normalTintColor:" : f_color(.Light),
                        "setXx_selectedTintColor:" : color]
                default:
                    break
                }
            } else if self is XXRoundCornerButton {//.Light, .Tint
                return [
                    "setXx_normalTintColor:" : color,
                    "setXx_highlightedTintColor:" : f_color(.Back)]
            }
        } else if self is UIPageControl {//.Light
            return [
                "setCurrentPageIndicatorTintColor" : color,
                "setPageIndicatorTintColor:" : f_color(.Light6)]
        } else if self is UISwitch {//.Tint
            return [
                "setOnTintColor:" : color,
                "setTintColor:" : f_color(.Light6)]
        } else if self is UIProgressView {//.Light4, .Tint
            return [
                "setXx_normalTintColor:" : color,
                "setXx_highlightedTintColor:" : f_color(.Light6)]
        } else if self is UISlider {
            switch style {
            case .Tint:
                return [
                    "setMinimumTrackTintColor:" : color,
                    "setMaximumTrackTintColor:" : f_color(.Light6)]
            case .Light5:
                return [
                    "setMinimumTrackTintColor:" : color,
                    "setMaximumTrackTintColor:" : UIColor.clearColor()]
            default:
                break
            }
        } else {
            return ["setBackgroundColor:" : color]
        }
        return nil
    }
}
