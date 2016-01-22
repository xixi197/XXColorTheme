//
//  ViewController.swift
//  XXColorTheme
//
//  Created by xixi197 on 16/1/15.
//  Copyright © 2016年 xixi197. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var defaultButton: XXTintColorButton!
    @IBOutlet weak var lightButton: XXTintColorButton!
    @IBOutlet weak var tintButton: XXTintColorButton!

    @IBOutlet weak var defaultTextButton: XXTintColorButton!
    @IBOutlet weak var lightTextButton: XXTintColorButton!
    @IBOutlet weak var tintTextButton: XXTintColorButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.xx_colorViewType = .DefaultBackgroundView
        defaultButton.xx_colorViewType = .DefaultXXTintColorButton
        lightButton.xx_colorViewType = .LightXXTintColorButton
        tintButton.xx_colorViewType = .TintXXTintColorButton

        defaultTextButton.xx_colorViewType = .DefaultXXTintColorButton
        lightTextButton.xx_colorViewType = .LightXXTintColorButton
        tintTextButton.xx_colorViewType = .TintXXTintColorButton

        update()
    }

    func update() {
        label.text = XXColorTheme.currentTheme.value.rawValue
    }

    @IBAction func change() {
        if (XXColorTheme.currentTheme.value == XXColorTheme.Dark) {
            XXColorTheme.currentTheme.value = XXColorTheme.Light
        } else if (XXColorTheme.currentTheme.value == XXColorTheme.Light) {
            XXColorTheme.currentTheme.value = XXColorTheme.Custom
        } else {
            XXColorTheme.currentTheme.value = XXColorTheme.Dark
        }
        update()
    }
}
