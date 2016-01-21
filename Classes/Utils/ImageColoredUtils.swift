//
//  ImageColoredUtils.swift
//  XXColorTheme
//
//  Created by xixi197 on 10/12/15.
//  Copyright © 2015 xixi197. All rights reserved.
//

import UIKit

extension UIImage {
    /// -> self + color
    func tintedImage(color: UIColor?) -> UIImage {
        guard let color = color else { return self }

        let rect = CGRectMake(0, 0, size.width, size.height)

        UIGraphicsBeginImageContextWithOptions(size, false, 0)

        color.setFill()
        UIRectFill(rect)

        drawInRect(rect, blendMode: .DestinationIn, alpha: 1)

        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    func expandedImage(size: CGSize) -> UIImage {
        let rect = CGRectMake((size.width - self.size.width) / 2, (size.height - self.size.height) / 2, self.size.width, self.size.height)

        UIGraphicsBeginImageContextWithOptions(size, false, 0)

        drawInRect(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    func borderedImage(width: CGFloat, radius: CGFloat, alpha: CGFloat) -> UIImage {
        if width == 0 || radius == 0 || alpha == 0 { return self }

        let Φ = 2 * radius
        let rect = CGRectMake(0, 0, Φ, Φ)
        let sourceImage = self.expandedImage(rect.size)

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)

        UIColor(white: 0, alpha: alpha).setStroke()
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, width)
        CGContextAddEllipseInRect(context, rect.insetBy(dx: width / 2, dy: width / 2))
        CGContextStrokePath(context);

        sourceImage.drawInRect(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image.imageWithRenderingMode(.AlwaysTemplate)
    }
}

extension UIColor {
    /// -> 1px image
    var image: UIImage {
        let rect = CGRectMake(0, 0, 1, 1)

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)

        setFill()
        UIRectFill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
