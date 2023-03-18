//
//  ViewController.swift
//  iosShcool
//
//  Created by Savely on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    var generator: ColorGeneratorProtocol
    generator = ColorGenerator(alpha: 1)
    
    let red = generator.color.red
    generator.color = Color(red: 0, green: 0, blue: 0, alpha: .bright)
    

  }

}
