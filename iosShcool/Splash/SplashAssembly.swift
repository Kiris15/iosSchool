//
//  SplashAssembly.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation

protocol SplashAssembly {

  func splashCoordinator() -> SplashCoordinator
  func splashVC() -> SplashViewController
  func splashDataProvider() -> SplashDataProvider
}

extension Assembly: SplashAssembly {
  func splashCoordinator() -> SplashCoordinator {
    .init(assembly: self, context: .init())

  }

  func splashVC() -> SplashViewController {
    .init(dataProvider: splashDataProvider())
  }

  func splashDataProvider() -> SplashDataProvider {
    SplashDataProviderImp()
  }

}
