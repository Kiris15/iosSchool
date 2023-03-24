//
//  AppCoordinator.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation
import UIKit

struct CoordinatorContext {}

class AppCoordinator: BaseCoordinator<CoordinatorContext> {

  private var window: UIWindow?

  func start(window: UIWindow) {
    self.window = window
    let coordinator = assembly.splashCoordinator { [weak self] in
      self?.startAuth()

    }
    setRoot(viewController: coordinator.make())
  }

  private func startAuth() {
    let coordinator = assembly.authCootdinator()
    setRoot(viewController: coordinator.make())
  }

  private func setRoot(viewController: UIViewController?) {

    guard let window, let viewController else {
      return
    }
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }
}
