//
//  AuthCoordinator.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation

import UIKit

class AuthCoordinator: BaseCoordinator<AuthCoordinator.Context> {

  struct Context {
    let onLoginSuccess: ((String) -> Void)?
  }

  override func make() -> UIViewController {
    let controller = assembly.authVC(onLoginSuccess: context.onLoginSuccess)

    controller.onOpenRegistration = { [weak controller] in
      let coordinator = self.assembly.registrationCoordinator(onLoginSuccess: self.context.onLoginSuccess)
      let registrationVC = coordinator.make()
      registrationVC.modalPresentationStyle = .fullScreen
      controller?.present(registrationVC, animated: true)
    }
    return controller
  }
}
