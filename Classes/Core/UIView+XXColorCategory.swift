//
//  UIView+XXColorCategory.swift
//  XXcolorCategory
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

//navgation
//title font18 light
//rightButton font16 tint

//player
//enTitle
//cnTitle font10 light
//sep

extension UIView {
    var xx_colorDictionary: [String: UIColor]? {
        guard let style = xx_colorStyle else { return nil }
        let color = XXColorCategory.preferredColorCategory.value.color

        if self is UILabel {
            //Light

            //playlist cell title font18
            //player en title left20 right 8
            //player cn title font10 left 8
            //player music title font20
            //player user title font16

            //cell title 16

            //text title font16
            //big text font16

            // Light2
            //playlist cell gene title font10
            //text sub font14 line22/1.6
            //cell setting sub fon16
            //tab off fon14
            //logout cell font16

            //    case LL//32
            //cell sub font12

            //    case sep//8
            //cell sep

            //Tint
            //more font14
            //tab on font14
            //bigtext font18
            return ["setTextColor:" : color(style)]
        } else if self is UIImageView {
            return ["setTintColor:" : color(style)]
        } else if self is UIButton {
            if self is XXTintColorButton {
                switch style {
                case .Light:
                    return [
                        "setXx_normalTintColor:" : color(style),
                        "setXx_highlightedTintColor:" : color(.Tint)]
                case .Light2, .Light3, .Light4, .Light5, .Light6:
                    return [
                        "setXx_normalTintColor:" : color(style),
                        "setXx_highlightedTintColor:" : color(.Light)]
                case .Tint:
                    return [
                        "setXx_normalTintColor:" : color(style),
                        "setXx_highlightedTintColor:" : color(style).colorWithAlphaComponent(0.48)]
                case .Mark:
                    return [
                        "setXx_normalTintColor:" : color(.Light),
                        "setXx_selectedTintColor:" : color(style)]
                default:
                    break
                }
            } else if self is XXRoundCornerButton {//.Light, .Tint
                return [
                    "setXx_normalTintColor:" : color(style),
                    "setXx_highlightedTintColor:" : color(.Back)]
            }
        } else if self is UIPageControl {//.Light
            return [
                "setCurrentPageIndicatorTintColor" : color(style),
                "setPageIndicatorTintColor:" : color(.Light6)]
        } else if self is UISwitch {//.Tint
            return [
                "setOnTintColor:" : color(style),
                "setTintColor:" : color(.Light6)]
        } else if self is UIProgressView {//.Light4, .Tint
            return [
                "setXx_normalTintColor:" : color(style),
                "setXx_highlightedTintColor:" : color(.Light6)]
        } else if self is UISlider {
            switch style {
            case .Tint:
                return [
                    "setMinimumTrackTintColor:" : color(style),
                    "setMaximumTrackTintColor:" : color(.Light6)]
            case .Light5:
                return [
                    "setMinimumTrackTintColor:" : color(style),
                    "setMaximumTrackTintColor:" : UIColor.clearColor()]
            default:
                break
            }
        } else {
            return ["setBackgroundColor:" : color(style)]
        }
        return nil
    }
}
