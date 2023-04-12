//
//  CharacterViewController.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import UIKit

class CharacterViewController: UIViewController {

  private let dataProvider: CharacterDataProvider

  init(dataProvider: CharacterDataProvider) {
    self.dataProvider = dataProvider

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    dataProvider.character(identifier: 8) { [weak self] resut in
      switch resut {
      case .success(let success):
        print(success)
      case .failure(let failure):
        print(failure.rawValue)
      }
    }
  }
}
