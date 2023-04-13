//
//  AuthViewController.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import UIKit

class AuthViewController<View: AuthView>: BaseViewController<View> {

  var onLoginSuccess: (() -> Void)?
  var onOpenRegistration: (() -> Void)?

  private let dataProvider: AuthDataProvider

  init(dataProvider: AuthDataProvider, onLoginSuccess: (() -> Void)?) {
    self.dataProvider = dataProvider
    self.onLoginSuccess = onLoginSuccess

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      rootView.update(with: AuthViewData())
      rootView.registrationAction = onOpenRegistration
      rootView.delegate = self

    }
}

// MARK: - AuthViewDelegate

extension AuthViewController: AuthViewDelegate {
  func loginButtonDidTap(login: String, password: String) {
    dataProvider.authorization(username: "ann", password: "1111") { [weak self] resut in
      self?.onLoginSuccess?()
      switch resut {
      case .success(let success):
        print("success")
        self?.onLoginSuccess?()
      case .failure(let failure):
        print(failure.rawValue)
      }
    }
  }
}
