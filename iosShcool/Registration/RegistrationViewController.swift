//
//  RegistrationViewController.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import UIKit

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

  var backToAuth: (() -> Void)?
  var onLoginSuccess: (() -> Void)?


  private let dataProvider: RegistrationDataProvider

  init(dataProvider: RegistrationDataProvider, onLoginSuccess: (() -> Void)?) {
    self.dataProvider = dataProvider
    self.onLoginSuccess = onLoginSuccess

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      dataProvider.registration(username: "kiriss", password: "123456") { [weak self] resut in
        switch resut {
        case .success(let success):
          print(success)
        case .failure(let failure):
          print(failure.rawValue)
        }
      }
      rootView.update(with: RegistrationViewData())
      rootView.backToAuthorization = backToAuth
    }
}
