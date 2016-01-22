//
//  XXTintColorButton.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/20.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

@IBDesignable public class XXTintColorButton: UIButton {

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

    private func xx_updateImageTintColor() {
        if selected {
            if highlighted {
                tintColor = _highlightedTintColor ?? _normalTintColor
            } else {
                tintColor = _selectedTintColor ?? _normalTintColor
            }
        } else {
            if highlighted {
                tintColor = _selectedTintColor ?? _highlightedTintColor ?? _normalTintColor
            } else {
                tintColor = _normalTintColor
            }
        }
    }

    public override var selected: Bool { didSet { xx_updateImageTintColor() } }

    public override var highlighted: Bool { didSet { xx_updateImageTintColor() } }

    @IBInspectable var xx_normalTintColor: UIColor? {
        get { return _normalTintColor }
        set {
            if newValue == _normalTintColor { return }
            _normalTintColor = newValue

            setTitleColor(_normalTintColor, forState: .Normal)
            xx_updateImageTintColor()
        }
    }

    @IBInspectable var xx_highlightedTintColor: UIColor? {
        get { return _highlightedTintColor }
        set {
            if newValue == _highlightedTintColor { return }
            _highlightedTintColor = newValue

            adjustsImageWhenHighlighted = newValue == nil
            setTitleColor(_highlightedTintColor, forState: .Highlighted)
            xx_updateImageTintColor()
        }
    }

    @IBInspectable var xx_selectedTintColor: UIColor? {
        get { return _selectedTintColor }
        set {
            if newValue == _selectedTintColor { return }
            _selectedTintColor = newValue

            adjustsImageWhenHighlighted = newValue == nil
            setTitleColor(_highlightedTintColor, forState: .Selected)
            xx_updateImageTintColor()
        }
    }

    private func xx_updateTemplateImage(templateImage: UIImage?, forState state: UIControlState) {
        setImage(templateImage?.borderedImage(xx_imageBorderWidth, radius: xx_imageBorderRadius, alpha: xx_imageBorderAlpha), forState: state)
    }

    private func xx_updateNormalTemplateImage() {
        xx_updateTemplateImage(_normalTemplateImage, forState: .Normal)
    }

    private func xx_updateHighlightedTemplateImage() {
        for state: UIControlState in [.Highlighted, .Selected] {
            xx_updateTemplateImage(_highlightedTemplateImage, forState: state)
        }
    }

    @IBInspectable var xx_normalTemplateImage: UIImage? {
        get { return _normalTemplateImage }
        set {
            if newValue == _normalTemplateImage { return }
            _normalTemplateImage = newValue

            xx_updateNormalTemplateImage()
        }
    }

    @IBInspectable var xx_highlightedTemplateImage: UIImage? {
        get { return _highlightedTemplateImage }
        set {
            if newValue == _highlightedTemplateImage { return }
            _highlightedTemplateImage = newValue

            xx_updateHighlightedTemplateImage()
        }
    }

    @IBInspectable var xx_imageBorderWidth: CGFloat {
        get { return _imageBorderWidth }
        set {
            if newValue == _imageBorderWidth { return }
            _imageBorderWidth = newValue

            xx_updateNormalTemplateImage()
            xx_updateHighlightedTemplateImage()
        }
    }

    @IBInspectable var xx_imageBorderRadius: CGFloat {
        get { return _imageBorderRadius }
        set {
            if newValue == _imageBorderRadius { return }
            _imageBorderRadius = newValue

            xx_updateNormalTemplateImage()
            xx_updateHighlightedTemplateImage()
        }
    }

    @IBInspectable var xx_imageBorderAlpha: CGFloat {
        get { return _imageBorderAlpha }
        set {
            if newValue == _imageBorderAlpha { return }
            _imageBorderAlpha = newValue

            xx_updateNormalTemplateImage()
            xx_updateHighlightedTemplateImage()
        }
    }

    public override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        return xx_isTextDown ?
            CGRectMake((contentRect.size.width - xx_imageWidth) / 2, 0, xx_imageWidth, xx_imageWidth) :
            super.imageRectForContentRect(contentRect)
    }

    public override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        return xx_isTextDown ?
            CGRectMake(0, xx_imageWidth + xx_textTopMargin, contentRect.size.width, contentRect.size.height - xx_imageWidth - xx_textTopMargin) :
            super.titleRectForContentRect(contentRect)
    }
}
