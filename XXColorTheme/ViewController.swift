//
//  ViewController.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/15.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeButton: TCButton!

    @IBOutlet weak var defaultColLabel: UILabel!
    @IBOutlet weak var lightColLabel: UILabel!
    @IBOutlet weak var tintColLabel: UILabel!
    @IBOutlet weak var normalRowLabel: UILabel!
    @IBOutlet weak var selectedRowLabel: UILabel!
    @IBOutlet weak var borderRowLabel: UILabel!
    @IBOutlet weak var textRowLabel: UILabel!

    @IBOutlet weak var defaultButton: TCButton!
    @IBOutlet weak var lightButton: TCButton!
    @IBOutlet weak var tintButton: TCButton!

    @IBOutlet weak var defaultSelectedButton: TCButton!
//    @IBOutlet weak var lightSelectedButton: TCButton!
//    @IBOutlet weak var tintSelectedButton: TCButton!

    @IBOutlet weak var defaultBorderButton: TCButton!
    @IBOutlet weak var lightBorderButton: TCButton!
//    @IBOutlet weak var tintBorderButton: TCButton!

    @IBOutlet weak var defaultTextButton: TCButton!
//    @IBOutlet weak var lightTextButton: TCButton!
    @IBOutlet weak var tintTextButton: TCButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.styled(.Back)
//        changeButton.xx_colorStyle = .Light

//        defaultColLabel.xx_colorStyle = .Light
//        lightColLabel.xx_colorStyle = .Light
//        tintColLabel.xx_colorStyle = .Light
//        normalRowLabel.xx_colorStyle = .Light
//        selectedRowLabel.xx_colorStyle = .Light
//        borderRowLabel.xx_colorStyle = .Light
//        textRowLabel.xx_colorStyle = .Light

//        defaultButton.styled(.Middle(normalImage: UIImage(named: "download")!))
//        lightButton.styled(.Light(normalImage: UIImage(named: "download")!))
        tintButton.styled(.MiddleMark(normalImage: UIImage(named: "like")!, highlightedImage: UIImage(named: "liked")!))

        defaultSelectedButton.styled(.MiddleHighlighted(normalImage: UIImage(named: "download")!, highlightedImage: UIImage(named: "downloaded")!))
//        lightSelectedButton.xx_colorStyle = .Light3
//        tintSelectedButton.xx_colorStyle = .Tint

        defaultBorderButton.styled(.LargeHighlighted(normalImage: UIImage(named: "download")!, highlightedImage: UIImage(named: "downloaded")!))
//        lightBorderButton.xx_colorStyle = .Light3
//        tintBorderButton.xx_colorStyle = .Tint

        defaultTextButton.styled(.TextLight)
//        lightTextButton.xx_colorStyle = .Light3
//        tintTextButton.xx_colorStyle = .Tint

        update()
    }

    func update() {
        changeButton.setTitle(XXColorCategory.preferredColorCategory.value.rawValue, forState: .Normal)
    }

    @IBAction func change(button: UIButton) {
        if (XXColorCategory.preferredColorCategory.value == XXColorCategory.Dark) {
            XXColorCategory.preferredColorCategory.value = XXColorCategory.Light
        } else if (XXColorCategory.preferredColorCategory.value == XXColorCategory.Light) {
            XXColorCategory.preferredColorCategory.value = XXColorCategory.Custom
        } else {
            XXColorCategory.preferredColorCategory.value = XXColorCategory.Dark
        }
        update()
    }

    @IBAction func selected(button: UIButton) {
        button.selected = !button.selected
    }
}
