//
//  RegistrationViewController.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import UIKit

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

  var backToAuth: (() -> Void)?
  var onLoginSuccess: ((String) -> Void)?

  private let dataProvider: RegistrationDataProvider

  init(dataProvider: RegistrationDataProvider, onLoginSuccess: ((String) -> Void)?) {
    self.dataProvider = dataProvider
    self.onLoginSuccess = onLoginSuccess

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    rootView.update(with: RegistrationViewData())
    rootView.backToAuthorization = backToAuth
    rootView.delegate = self
  }
}

// MARK: - RegistrViewDelegate

extension RegistrationViewController: RegistrationViewDelegate {
  func registrConfirmButtonDidTap(login: String, password: String, repeatPassword: String) {
    dataProvider.registration(
      login: login,
      password: password,
      repeatPassword: repeatPassword
    ) { [weak self] resut in
      switch resut {
      case .success(let success):
        print(success)
        self?.onLoginSuccess?(success.userId)
      case .failure(let failure):
        self?.showAlert(message: failure.rawValue)
      }
    }
  }
}
