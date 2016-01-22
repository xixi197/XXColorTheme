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

        view.xx_colorViewType = .DefaultBackgroundView
        changeButton.xx_colorViewType = .DefaultXXTintColorButton

        defaultButton.xx_colorViewType = .DefaultXXTintColorButton
        lightButton.xx_colorViewType = .LightXXTintColorButton
        tintButton.xx_colorViewType = .TintXXTintColorButton

        defaultSelectedButton.xx_colorViewType = .MarkXXTintColorButton
        lightSelectedButton.xx_colorViewType = .LightXXTintColorButton
        tintSelectedButton.xx_colorViewType = .TintXXTintColorButton

        defaultBorderButton.xx_colorViewType = .DefaultXXTintColorButton
        lightBorderButton.xx_colorViewType = .LightXXTintColorButton
        tintBorderButton.xx_colorViewType = .TintXXTintColorButton

        defaultTextButton.xx_colorViewType = .DefaultXXTintColorButton
        lightTextButton.xx_colorViewType = .LightXXTintColorButton
        tintTextButton.xx_colorViewType = .TintXXTintColorButton

        update()
    }

    func update() {
        changeButton.setTitle(XXColorTheme.currentTheme.value.rawValue, forState: .Normal)
    }

    @IBAction func change(button: UIButton) {
        if (XXColorTheme.currentTheme.value == XXColorTheme.Dark) {
            XXColorTheme.currentTheme.value = XXColorTheme.Light
        } else if (XXColorTheme.currentTheme.value == XXColorTheme.Light) {
            XXColorTheme.currentTheme.value = XXColorTheme.Custom
        } else {
            XXColorTheme.currentTheme.value = XXColorTheme.Dark
        }
        update()
    }

    @IBAction func selected(button: UIButton) {
        button.selected = !button.selected
    }
}
