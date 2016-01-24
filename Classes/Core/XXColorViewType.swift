//
//  XXColorViewType.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/21.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

public enum XXColorViewType: String {
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
        let colorTheme = XXColorTheme.currentTheme
        switch self {
        case DefaultBackgroundView:
            return [
                "setBackgroundColor:": colorTheme.value.color(.Background)]
        case ContentBackgroundView:
            return [
                "setBackgroundColor:": colorTheme.value.color(.ContentBackground)]

        case DefaultLabel:
            return [
                "setTextColor:": colorTheme.value.color(.Content)]

        case DefaultXXTintColorButton:
            return [
                "setXx_normalTintColor:": colorTheme.value.color(.Content),
                "setXx_highlightedTintColor:": colorTheme.value.color(.Tint)]
        case LightXXTintColorButton:
            return [
                "setXx_normalTintColor:": colorTheme.value.color(.Content).colorWithAlphaComponent(0.48),
                "setXx_highlightedTintColor:": colorTheme.value.color(.Content)]
        case LightXXTintColorButton2:
            return [
                "setXx_normalTintColor:": colorTheme.value.color(.Content).colorWithAlphaComponent(0.32),
                "setXx_highlightedTintColor:": colorTheme.value.color(.Content)]
        case TintXXTintColorButton:
            return [
                "setXx_normalTintColor:": colorTheme.value.color(.Tint),
                "setXx_highlightedTintColor:": colorTheme.value.color(.Tint).colorWithAlphaComponent(0.48)]
        case MarkXXTintColorButton:
            return [
                "setXx_normalTintColor:": colorTheme.value.color(.Content),
                "setXx_selectedTintColor:": colorTheme.value.color(.Mark)]

        case DefaultXXRoundCornerButton:
            return [
                "setXx_normalTintColor:": colorTheme.value.color(.Content),
                "setXx_highlightedTintColor:": colorTheme.value.color(.Background)]
        case TintXXRoundCornerButton:
            return [
                "setXx_normalTintColor:": colorTheme.value.color(.Tint),
                "setXx_highlightedTintColor:": colorTheme.value.color(.Background)]

        case DefaultPageControl:
            return [
                "setPageIndicatorTintColor:": colorTheme.value.color(.Content).colorWithAlphaComponent(0.16),
                "setCurrentPageIndicatorTintColor": colorTheme.value.color(.Content)]

        case DefaultSwitch:
            return [
                "setTintColor:": colorTheme.value.color(.Content).colorWithAlphaComponent(0.08),
                "setOnTintColor:": colorTheme.value.color(.Tint)]

        case DefaultProgressView:
            return [
                "setProgressTintColor:": colorTheme.value.color(.Tint),
                "setTrackTintColor:": colorTheme.value.color(.Content).colorWithAlphaComponent(0.08)]
        case PlayerProgressView:
            return [
                "setProgressTintColor:": colorTheme.value.color(.Content).colorWithAlphaComponent(0.32),
                "setTrackTintColor:": colorTheme.value.color(.Content).colorWithAlphaComponent(0.08)]

        case DefaultSlider:
            return [
                "setMinimumTrackTintColor:": colorTheme.value.color(.Tint),
                "setMaximumTrackTintColor:": colorTheme.value.color(.Content).colorWithAlphaComponent(0.08),
                "setThumbTintColor:": colorTheme.value.color(.Content)]
        case PlayerSlider:
            return [
                "setMinimumTrackTintColor:": colorTheme.value.color(.Content).colorWithAlphaComponent(0.16),
                "setMaximumTrackTintColor:": UIColor.clearColor(),
                "setThumbTintColor:": colorTheme.value.color(.Content)]
        }
    }
}