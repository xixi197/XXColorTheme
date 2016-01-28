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
    case Light  // Foreground
    case Light2 // 64
    case Light3 // 48
    case Light4 // 32
    case Light5 // 16
    case Light6 // 8

    case Dark   // Background
    case Dark2  // 64
    case Dark3  // 48
    case Dark4  // 32
    case Dark5  // 16
    case Dark6  // 8

    case Back
    case Tint
    case Mark
    case Clear

    private static let alphaDictionary : [XXColorStyle : CGFloat] = [
        .Light2 : 0.64,
        .Light3 : 0.48,
        .Light4 : 0.32,
        .Light5 : 0.16,
        .Light6 : 0.08,
        .Dark2  : 0.64,
        .Dark3  : 0.48,
        .Dark4  : 0.32,
        .Dark5  : 0.16,
        .Dark6  : 0.08]

    var alpha: CGFloat {
        return XXColorStyle.alphaDictionary[self] ?? 1
    }

    var color: UIColor {
        let colorCategory = XXColorCategory.preferredColorCategory.value
        switch self {
        case .Light2, .Light3, .Light4, .Light5, .Light6:
            return XXColorStyle.Light.color.colorWithAlphaComponent(alpha)
        case .Dark2, .Dark3, .Dark4, .Dark5, .Dark6:
            return XXColorStyle.Dark.color.colorWithAlphaComponent(alpha)
        case .Clear:
            return UIColor.clearColor()
        default:
            return XXColorCategory.colorDictionary[colorCategory]![self]!
        }
    }
}

public enum XXColorCategory: String {
    case Dark
    case Light
    case Custom

    static let preferredColorCategory = Variable(XXColorCategory.Dark)
    private static let colorDictionary: [XXColorCategory : [XXColorStyle : UIColor]] = [
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
            .Light: UIColor.whiteColor(),
            .Dark: UIColor.blackColor(),
            .Back: UIColor(hex6: 0x212121),
            .Tint: UIColor(hex6: 0xF44336),
            .Mark: UIColor(hex6: 0x00B9F2)]]
}
