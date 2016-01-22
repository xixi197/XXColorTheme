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

    case DefaultLabel

    case DefaultXXTintColorButton
    case LightXXTintColorButton
    case LightXXTintColorButton2
    case TintXXTintColorButton
    case MarkXXTintColorButton

    var dictionary: [String: UIColor] {
        let colorTheme = XXColorTheme.currentTheme
        switch self {
        case DefaultBackgroundView:
            return [
                "setBackgroundColor:": colorTheme.value.color(.Background)]

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
        }
    }
}