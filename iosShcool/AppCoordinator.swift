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
    let coordinator = assembly.authCoordinator { [weak self] in

      DispatchQueue.main.async {
        self?.setTabVC()
      }
    }
    setRoot(viewController: coordinator.make())
  }

  private func setTabVC() {
    let tabVC = assembly.rootTabBarControlller()
    let locationCoord = assembly.splashCoordinator(onSuccess: nil)
    let cabinetCoordinator = assembly.cabinetCoodrinator()

    let locationVC = locationCoord.make()
    let cabinetVC = cabinetCoordinator.make()

    let navVC = assembly.rootNavigationController()
    navVC.setViewControllers([locationVC], animated: false)
    navVC.tabBarItem = RootTab.locations.tabBarItem

    cabinetVC.tabBarItem = RootTab.cabinet.tabBarItem
    tabVC.setViewControllers([navVC, cabinetVC], animated: false)
    setRoot(viewController: tabVC)
  }

  private func setRoot(viewController: UIViewController?) {

    guard let window, let viewController else {
      return
    }
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }
}
