//
//  CabinetViewController.swift
//  iosSchool
//
//  Created by Savely on 10.04.2023.
//

import UIKit

class CabinetViewController<View: CabinetView>: BaseViewController<View> {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .darkGray
    setupBar()
    rootView.makeView()
  }

  private func setupBar() {
    title = "Профиль"
    navigationController?.navigationBar.titleTextAttributes = [
      .foregroundColor: UIColor(named: "DarkBlue") ?? .black,
      .font: UIFont.systemFont(ofSize: 18)
    ]
  }
}
