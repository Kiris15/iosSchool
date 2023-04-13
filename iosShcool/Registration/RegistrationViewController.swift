//
//  RegistrationViewController.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import UIKit

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

  var backToAuth: (() -> Void)?

  private let dataProvider: RegistrationDataProvider

  init(dataProvider: RegistrationDataProvider) {
    self.dataProvider = dataProvider

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .red

      dataProvider.registration(username: "kiriss", password: "123456") { [weak self] resut in
        switch resut {
        case .success(let success):
          print("success")
        case .failure(let failure):
          print(failure.rawValue)
        }
      }
      rootView.update(with: RegistrationViewData())
      rootView.backToAuthorization = backToAuth
      rootView.delegate = self
    }
}

// MARK: - RegistrViewDelegate

extension RegistrationViewController: RegistrViewDelegate {
  func registrConfirmButtonDidTap(login: String, password: String, repeatPassword: String) {

  }
}
