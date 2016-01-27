//
//  XXFontSizeCategory.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/25.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit
import RxSwift

enum XXFontSizeStyle: String {
    case Title1             // system L 28
    case Title2             // system L 22
    case Title3             // system L 20
    case Headline           // system L 17
    case Subheadline        // system L 15
    case Body               // system L 17
    case Callout            // system L 16
    case Footnote           // system L 13 min12
    case Caption1           // system L 12 min11
    case Caption2           // system L 11 min11

    private static let sizeDictionary : [XXFontSizeStyle : CGFloat] = [
        .Title1         : 28,//28.0
        .Title2         : 20,//22.0
        .Title3         : 18,//20.0
        .Headline       : 16,//17.0
        .Subheadline    : 12,//15.0
        .Body           : 17,//17.0
        .Callout        : 16,//16.0
        .Footnote       : 13,//13.0
        .Caption1       : 12,//12.0
        .Caption2       : 10]//11

    var fontSize: CGFloat {
        return XXFontSizeStyle.sizeDictionary[self]!
    }
}

public enum XXFontSizeCategory: CGFloat {
    case ExtraSmall             = -3
    case Small                  = -2
    case Medium                 = -1
    case Large                  = 0
    case ExtraLarge             = 2
    case ExtraExtraLarge        = 4
    case ExtraExtraExtraLarge   = 6

    static let preferredFontSizeCategory = Variable(XXFontSizeCategory.Large)

    func fontSize(style: XXFontSizeStyle) -> CGFloat {
        return style.fontSize + rawValue
    }
}
