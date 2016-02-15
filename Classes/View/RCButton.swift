//
//  RCButton.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/22.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

//RoundCorner
@IBDesignable public class RCButton: UIButton {

    // tintColor ColorTheme
    private var _normalTintColor: UIColor?
    private var _highlightedTintColor: UIColor?

    private var _borderWidth: CGFloat = 0//big1
    private var _cornerRadius: CGFloat = 0//big2

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }

    private func initButton() {
        clipsToBounds = true
    }

    @IBInspectable var xx_normalTintColor: UIColor? {
        get { return _normalTintColor }
        set {
            if newValue == _normalTintColor { return }
            _normalTintColor = newValue

            setTitleColor(_normalTintColor, forState: .Normal)
            layer.borderColor = _normalTintColor?.CGColor
            setBackgroundImage(_normalTintColor?.image, forState: .Highlighted)
        }
    }

    @IBInspectable var xx_highlightedTintColor: UIColor? {
        get { return _highlightedTintColor }
        set {
            if newValue == _highlightedTintColor { return }
            _highlightedTintColor = newValue

            setTitleColor(_highlightedTintColor, forState: .Highlighted)
        }
    }

    @IBInspectable var xx_borderWidth: CGFloat {
        get { return _borderWidth }
        set {
            if newValue == _borderWidth { return }
            _borderWidth = newValue

            layer.borderWidth = _borderWidth
        }
    }

    @IBInspectable var xx_cornerRadius: CGFloat {
        get { return _cornerRadius }
        set {
            if newValue == _cornerRadius { return }
            _cornerRadius = newValue

            layer.cornerRadius = _cornerRadius
        }
    }
}
