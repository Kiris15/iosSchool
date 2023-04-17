//
//  BaseNavigationController.swift
//  iosSchool
//
//  Created by Savely on 10.04.2023.
//

import UIKit

class BaseNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationBar.prefersLargeTitles = false
    navigationBar.isTranslucent = false
    navigationBar.backgroundColor = .white
    view.backgroundColor = .white
  }

  override var childForStatusBarStyle: UIViewController? {
    topViewController
  }
}
