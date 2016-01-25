//
//  XXColorViewStyle.swift
//  XXcolorCategory
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

public enum XXColorViewStyle: String {
    case DefaultBackgroundView

    case ContentBackgroundView
    // player nav sep width1 height24
    // player user icon

    //    case LightView// 32
    // player user right traigle

    //    case Liner
    //player black32-0

    case DefaultLabel
    //navgation title font18
    //playlist cell title font18
    //player en title left20 right 8
    //player cn title font10 left 8
    //player music title font20
    //player user title font16

    //cell title 16

    //text title font16
    //big text font16

    case LightLabel// 64
    //playlist cell gene title font10
    //text sub font14 line22/1.6
    //cell setting sub fon16
    //tab off fon14
    //logout cell font16

    //    case LL//32
    //cell sub font12

    //    case sep//8
    //cell sep

    case TintLabel
    //more font14
    //tab on font14
    //bigtext font18

    case DefaultXXTintColorButton
    case LightXXTintColorButton
    case LightXXTintColorButton2
    case TintXXTintColorButton
    //nav right font16 right15 righttraigle8
    case MarkXXTintColorButton

    case DefaultXXRoundCornerButton1//big18
    case TintXXRoundCornerButton

    case DefaultPageControl

    case DefaultSwitch

    case DefaultProgressView
    case PlayerProgressView

    case DefaultSlider
    case PlayerSlider

    var dictionary: [String: UIColor] {
        let color = XXColorCategory.preferredColorCategory.value.color
        switch self {
        case DefaultBackgroundView:
            return [
                "setBackgroundColor:": color(.Back)]
        case ContentBackgroundView:
            return [
                "setBackgroundColor:": color(.Background)]

        case DefaultLabel:
            return [
                "setTextColor:": color(.Foreground)]

        case DefaultXXTintColorButton:
            return [
                "setXx_normalTintColor:": color(.Foreground),
                "setXx_highlightedTintColor:": color(.Tint)]
        case LightXXTintColorButton:
            return [
                "setXx_normalTintColor:": color(.Foreground).colorWithAlphaComponent(0.48),
                "setXx_highlightedTintColor:": color(.Foreground)]
        case LightXXTintColorButton2:
            return [
                "setXx_normalTintColor:": color(.Foreground).colorWithAlphaComponent(0.32),
                "setXx_highlightedTintColor:": color(.Foreground)]
        case TintXXTintColorButton:
            return [
                "setXx_normalTintColor:": color(.Tint),
                "setXx_highlightedTintColor:": color(.Tint).colorWithAlphaComponent(0.48)]
        case MarkXXTintColorButton:
            return [
                "setXx_normalTintColor:": color(.Foreground),
                "setXx_selectedTintColor:": color(.Mark)]

        case DefaultXXRoundCornerButton1:
            return [
                "setXx_normalTintColor:": color(.Foreground),
                "setXx_highlightedTintColor:": color(.Back)]
        case TintXXRoundCornerButton:
            return [
                "setXx_normalTintColor:": color(.Tint),
                "setXx_highlightedTintColor:": color(.Back)]

        case DefaultPageControl:
            return [
                "setPageIndicatorTintColor:": color(.Foreground).colorWithAlphaComponent(0.16),
                "setCurrentPageIndicatorTintColor": color(.Foreground)]

        case DefaultSwitch:
            return [
                "setTintColor:": color(.Foreground).colorWithAlphaComponent(0.08),
                "setOnTintColor:": color(.Tint)]

        case DefaultProgressView:
            return [
                "setProgressTintColor:": color(.Tint),
                "setTrackTintColor:": color(.Foreground).colorWithAlphaComponent(0.08)]
        case PlayerProgressView:
            return [
                "setProgressTintColor:": color(.Foreground).colorWithAlphaComponent(0.32),
                "setTrackTintColor:": color(.Foreground).colorWithAlphaComponent(0.08)]

        case DefaultSlider:
            return [
                "setMinimumTrackTintColor:": color(.Tint),
                "setMaximumTrackTintColor:": color(.Foreground).colorWithAlphaComponent(0.08),
                "setThumbTintColor:": color(.Foreground)]
        case PlayerSlider:
            return [
                "setMinimumTrackTintColor:": color(.Foreground).colorWithAlphaComponent(0.16),
                "setMaximumTrackTintColor:": UIColor.clearColor(),
                "setThumbTintColor:": color(.Foreground)]
        }
    }
}