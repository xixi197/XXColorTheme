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

//public extension UIColor {
//    class func randomColor() -> UIColor {
//        return UIColor(hex6: UInt32(random() % 16777211))
//    }
//}

enum XXColorStyle {
    case Foreground
    case Background
    case Back
    case Tint
    case Mark
}

public enum XXColorCategory: String {
    case Dark
    case Light
    case Custom

    static let preferredColorCategory = Variable(XXColorCategory.Dark)
    static let colorDictionary: [XXColorCategory : [XXColorStyle : UIColor]] = [
        .Dark : [
            .Foreground: UIColor.whiteColor(),
            .Background: UIColor.blackColor(),
            .Back: UIColor(hex6: 0x212121),
            .Tint: UIColor(hex6: 0x00B9F2),
            .Mark: UIColor(hex6: 0xF44336)],
        .Light : [
            .Foreground: UIColor.blackColor(),
            .Background: UIColor.whiteColor(),
            .Back: UIColor(hex6: 0xDEDEDE),
            .Tint: UIColor(hex6: 0x00B9F2),
            .Mark: UIColor(hex6: 0xF44336)],
        .Custom : [
            .Foreground: UIColor.blackColor(),
            .Background: UIColor.whiteColor(),
            .Back: UIColor(hex6: 0xDEDEDE),
            .Tint: UIColor(hex6: 0x00B9F2),
            .Mark: UIColor(hex6: 0xF44336)]]

    func color(style: XXColorStyle) -> UIColor {
        return XXColorCategory.colorDictionary[self]![style]!
    }
}
