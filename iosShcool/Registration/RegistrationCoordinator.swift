//
//  RegistrationCoordinator.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import UIKit

class RegistrationCoordinator: BaseCoordinator<RegistrationCoordinator.Context> {

  struct Context {
  let onLoginSuccess: (() -> Void)?
  }

  override func make() -> UIViewController {
    let controller = assembly.registrationVC(onLoginSuccess: context.onLoginSuccess)

    controller.backToAuth = { [weak controller] in
      controller?.dismiss(animated: true)
    }
    return controller
  }
}
