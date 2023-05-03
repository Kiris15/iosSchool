//
//  CabinetViewController.swift
//  iosSchool
//
//  Created by Savely on 10.04.2023.
//

import UIKit

class CabinetViewController<View: CabinetView>: BaseViewController<View> {

  var escapeToAuth: (() -> Void)?

  init(escapeToAuth: ( () -> Void)?) {
    self.escapeToAuth = escapeToAuth

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    rootView.makeView()
    rootView.delegate = self
  }
}

// MARK: - CabinetViewDelegate

extension CabinetViewController: CabinetViewDelegate {
  func escapeButtonDidTap() {
    self.escapeToAuth?()
  }
}
