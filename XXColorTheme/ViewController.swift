//
//  ViewController.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/15.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeButton: XXTintColorButton!

    @IBOutlet weak var defaultColLabel: UILabel!
    @IBOutlet weak var lightColLabel: UILabel!
    @IBOutlet weak var tintColLabel: UILabel!
    @IBOutlet weak var normalRowLabel: UILabel!
    @IBOutlet weak var selectedRowLabel: UILabel!
    @IBOutlet weak var borderRowLabel: UILabel!
    @IBOutlet weak var textRowLabel: UILabel!

    @IBOutlet weak var defaultButton: XXTintColorButton!
    @IBOutlet weak var lightButton: XXTintColorButton!
    @IBOutlet weak var tintButton: XXTintColorButton!

    @IBOutlet weak var defaultSelectedButton: XXTintColorButton!
    @IBOutlet weak var lightSelectedButton: XXTintColorButton!
    @IBOutlet weak var tintSelectedButton: XXTintColorButton!

    @IBOutlet weak var defaultBorderButton: XXTintColorButton!
    @IBOutlet weak var lightBorderButton: XXTintColorButton!
    @IBOutlet weak var tintBorderButton: XXTintColorButton!

    @IBOutlet weak var defaultTextButton: XXTintColorButton!
    @IBOutlet weak var lightTextButton: XXTintColorButton!
    @IBOutlet weak var tintTextButton: XXTintColorButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.xx_colorStyle = .Back
        changeButton.xx_colorStyle = .Light

        defaultColLabel.xx_colorStyle = .Light
        lightColLabel.xx_colorStyle = .Light
        tintColLabel.xx_colorStyle = .Light
        normalRowLabel.xx_colorStyle = .Light
        selectedRowLabel.xx_colorStyle = .Light
        borderRowLabel.xx_colorStyle = .Light
        textRowLabel.xx_colorStyle = .Light

        defaultButton.xx_colorStyle = .Light
        lightButton.xx_colorStyle = .Light3
        tintButton.xx_colorStyle = .Tint

        defaultSelectedButton.xx_colorStyle = .Mark
        lightSelectedButton.xx_colorStyle = .Light3
        tintSelectedButton.xx_colorStyle = .Tint

        defaultBorderButton.xx_colorStyle = .Light
        lightBorderButton.xx_colorStyle = .Light3
        tintBorderButton.xx_colorStyle = .Tint

        defaultTextButton.xx_colorStyle = .Light
        lightTextButton.xx_colorStyle = .Light3
        tintTextButton.xx_colorStyle = .Tint

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
