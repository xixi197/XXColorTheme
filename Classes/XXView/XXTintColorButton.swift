//
//  XXTintColorButton.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/20.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

class XXTintColorButton: UIButton {

    private var _normalTintColor: UIColor?
    private var _highlightedTintColor: UIColor?
    private var _normalTemplateImage: UIImage?
    private var _highlightedTemplateImage: UIImage?

    var xx_imageBorderWidth: CGFloat = 0
    var xx_imageBorderRadius: CGFloat = 30
    var xx_imageBorderAlpha: CGFloat = 0.16

    var xx_isTextDown = false
    var xx_imageWidth: CGFloat = 60
    var xx_textTopMargin: CGFloat = 10

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        return xx_isTextDown ?
            CGRectMake((contentRect.size.width - xx_imageWidth) / 2, 0, xx_imageWidth, xx_imageWidth) :
            super.imageRectForContentRect(contentRect)
    }

    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        return xx_isTextDown ?
            CGRectMake(0, xx_imageWidth + xx_textTopMargin, contentRect.size.width, contentRect.size.height - xx_imageWidth - xx_textTopMargin) :
            super.titleRectForContentRect(contentRect)
    }

    private func _setTintColor(color: UIColor?, withImage image: UIImage?, forState state: UIControlState) {
        setTitleColor(color, forState: state)
        setImage(image?.borderedImage(xx_imageBorderWidth, radius: xx_imageBorderRadius, alpha: xx_imageBorderAlpha).tintedImage(color), forState: state)
    }

    private func xx_updateNormalTintColor() {
        _setTintColor(_normalTintColor, withImage: _normalTemplateImage, forState: .Normal)
    }

    private func xx_updateHighlightedTintColor() {
        for state: UIControlState in [.Highlighted, .Selected] {
            _setTintColor(_highlightedTintColor, withImage: _highlightedTemplateImage ?? _normalTemplateImage, forState: state)
        }
    }

    var xx_normalTintColor: UIColor? {
        get { return _normalTintColor }
        set {
            if newValue == _normalTintColor { return }
            _normalTintColor = newValue

            xx_updateNormalTintColor()
        }
    }

    var xx_highlightedTintColor: UIColor? {
        get { return _highlightedTintColor }
        set {
            if newValue == _highlightedTintColor { return }
            _highlightedTintColor = newValue

            xx_updateHighlightedTintColor()
        }
    }

    var xx_normalTemplateImage: UIImage? {
        get { return _normalTemplateImage }
        set {
            if newValue == _normalTemplateImage { return }
            _normalTemplateImage = newValue

            xx_updateNormalTintColor()
        }
    }

    var xx_highlightedTemplateImage: UIImage? {
        get { return _highlightedTemplateImage }
        set {
            if newValue == _highlightedTemplateImage { return }
            _highlightedTemplateImage = newValue
            
            xx_updateHighlightedTintColor()
        }
    }
}
