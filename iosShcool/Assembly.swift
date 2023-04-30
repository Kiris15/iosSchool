//
//  Assembly.swift
//  iosSchool
//
//  Created by Savely on 17.03.2023.
//

import UIKit

class Assembly {

  var apiClient: ApiClient {
    ApiClient()
  }

  lazy var imageService: ImageService = ImageServiceImp(apiClient: apiClient)
  lazy var storageManager: StorageManager = StorageManagerImp()

  func colorGenerator (alpha: Double) -> ColorGenerator {
    ColorGenerator(alpha: alpha)
  }

  func appCoordinator() -> AppCoordinator {
    AppCoordinator(assembly: self, context: CoordinatorContext())
  }

  func rootTabBarControlller() -> UITabBarController {
    TabBarController()
  }

  func rootNavigationController() -> UINavigationController {
    let controller = BaseNavigationController()
    controller.modalPresentationStyle = .fullScreen
    return controller
  }
}
