//
//  XXColorCategory.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/15.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit
import RxSwift
import UIColor_Hex_Swift

enum XXColorStyle: String {
    case Light//Foreground
    case Light2//64
    case Light3//48
    case Light4//32
    case Light5//16
    case Light6//8
    case Dark//Background
    case Dark2//64
    case Dark3//48
    case Dark4//32
    case Dark5//16
    case Dark6//8
    case Back
    case Tint
    case Mark

    var alpha: CGFloat {
        switch self {
        case .Light2, .Dark2:
            return 0.64
        case .Light3, .Dark3:
            return 0.48
        case .Light4, .Dark4:
            return 0.32
        case .Light5, .Dark5:
            return 0.16
        case .Light6, .Dark6:
            return 0.08
        default:
            return 1
        }
    }
}

public enum XXColorCategory: String {
    case Dark
    case Light
    case Custom

    static let preferredColorCategory = Variable(XXColorCategory.Dark)
    static let colorDictionary: [XXColorCategory : [XXColorStyle : UIColor]] = [
        .Dark : [
            .Light: UIColor.whiteColor(),
            .Dark: UIColor.blackColor(),
            .Back: UIColor(hex6: 0x212121),
            .Tint: UIColor(hex6: 0x00B9F2),
            .Mark: UIColor(hex6: 0xF44336)],
        .Light : [
            .Light: UIColor.blackColor(),
            .Dark: UIColor.whiteColor(),
            .Back: UIColor(hex6: 0xDEDEDE),
            .Tint: UIColor(hex6: 0x00B9F2),
            .Mark: UIColor(hex6: 0xF44336)],
        .Custom : [
            .Light: UIColor.blackColor(),
            .Dark: UIColor.blackColor(),
            .Back: UIColor(hex6: 0x212121),
            .Tint: UIColor(hex6: 0xF44336),
            .Mark: UIColor(hex6: 0xF44336)]]

    func color(style: XXColorStyle) -> UIColor {
        switch style {
        case .Light2, .Light3, .Light4, .Light5, .Light6:
            let color = XXColorCategory.colorDictionary[self]![.Light]!
            return color.colorWithAlphaComponent(style.alpha)
        case .Dark2, .Dark3, .Dark4, .Dark5, .Dark6:
            let color = XXColorCategory.colorDictionary[self]![.Dark]!
            return color.colorWithAlphaComponent(style.alpha)
        default:
            return XXColorCategory.colorDictionary[self]![style]!
        }
    }
}
