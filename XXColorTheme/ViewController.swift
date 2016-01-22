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
    @IBOutlet weak var LightButton: XXTintColorButton!
    @IBOutlet weak var LightButton2: XXTintColorButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.xx_colorViewType = .DefaultBackgroundView
        defaultButton.xx_colorViewType = .DefaultXXTintColorButton
        LightButton.xx_colorViewType = .LightXXTintColorButton
        LightButton2.xx_colorViewType = .LightXXTintColorButton2

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
