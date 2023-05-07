//
//  CabinetViewController.swift
//  iosSchool
//
//  Created by Savely on 10.04.2023.
//

import UIKit

class CabinetViewController<View: CabinetView>: BaseViewController<View> {

  var escapeToAuth: (() -> Void)?

  private let storageManager: StorageManager

  init(escapeToAuth: (() -> Void)?, storageManager: StorageManager) {
    self.escapeToAuth = escapeToAuth
    self.storageManager = storageManager

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    rootView.makeView()
    rootView.cabinetData = CabinetViewData(
      color: .clear,
      userName: storageManager.getUsername() ?? "Логин пользователя",
      dateOfLastEntrance: storageManager.getDate() ?? ".. .. ...."
    )
    rootView.delegate = self
  }
}

// MARK: - CabinetViewDelegate

extension CabinetViewController: CabinetViewDelegate {
  func escapeButtonDidTap() {
    storageManager.removeToken()
    self.escapeToAuth?()
  }
}
