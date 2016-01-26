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
    case Title1
    case Title2
    case Title3
    case Headline
    case Subheadline
    case Body
    case Callout
    case Footnote
    case Caption1
    case Caption2
}

public enum XXFontSizeCategory: String {
    //    case ExtraSmall
    //    case Small
    //    case Medium
    case Large
    case ExtraLarge
    //    case ExtraExtraLarge
    //    case ExtraExtraExtraLarge

    static let preferredFontSizeCategory = Variable(XXFontSizeCategory.Large)
    static let fontSizeDictionary: [XXFontSizeCategory : [XXFontSizeStyle : CGFloat]] = [
        .Large : [
            .Title1: 18,
            .Title2: 18,
            .Title3: 18,
            .Headline: 18,
            .Subheadline: 18,
            .Body: 18,
            .Callout: 18,
            .Footnote: 18,
            .Caption1: 18,
            .Caption2: 18],
        .ExtraLarge : [
            .Title1: 18,
            .Title2: 18,
            .Title3: 18,
            .Headline: 18,
            .Subheadline: 18,
            .Body: 18,
            .Callout: 18,
            .Footnote: 18,
            .Caption1: 18,
            .Caption2: 18]]

    func fontSize(style: XXFontSizeStyle) -> CGFloat {
        return XXFontSizeCategory.fontSizeDictionary[self]![style]!
    }
}
