//
//  XXRoundCornerButton.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/22.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

@IBDesignable public class XXRoundCornerButton: UIButton {

    // tintColor ColorTheme
    private var _normalTintColor: UIColor?
    private var _highlightedTintColor: UIColor?
    private var _selectedTintColor: UIColor?

    // image
    private var _normalTemplateImage: UIImage?
    private var _highlightedTemplateImage: UIImage?

    // all image
    private var _imageBorderWidth: CGFloat = 0
    private var _imageBorderRadius: CGFloat = 30
    private var _imageBorderAlpha: CGFloat = 0.16

    @IBInspectable var xx_isTextDown: Bool = false {
        didSet {
            titleLabel?.textAlignment = .Center
        }
    }
    var xx_imageWidth: CGFloat = 60 // 82 * 82
    var xx_textTopMargin: CGFloat = 8

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
