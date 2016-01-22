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
    @IBOutlet weak var button: XXTintColorButton!
    @IBOutlet weak var button2: XXTintColorButton!

    override func viewDidLoad() {
        super.viewDidLoad()

//        button.xx_normalTemplateImage = UIImage(named: "like")
//        button.xx_highlightedTemplateImage = UIImage(named: "liked")
        button.xx_colorViewType = .DefaultXXTintColorButton

//        button2.xx_normalTemplateImage = UIImage(named: "download")
//        button2.xx_highlightedTemplateImage = UIImage(named: "downloaded")
//        button2.xx_imageBorderWidth = 1
        button2.xx_colorViewType = .LightXXTintColorButton
    }

    @IBAction func change() {
        if (XXColorTheme.currentTheme.value == XXColorTheme.Light) {
            XXColorTheme.currentTheme.value = XXColorTheme.Dark
        } else if (XXColorTheme.currentTheme.value == XXColorTheme.Dark) {
            XXColorTheme.currentTheme.value = XXColorTheme.Custom
        } else {
            XXColorTheme.currentTheme.value = XXColorTheme.Light
        }
    }
}
