//
//  SplashAssembly.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation

protocol SplashAssembly {

  func splashCoordinator(onSuccess: (() -> Void)?) -> SplashCoordinator
  func splashVC(onSuccess: (() -> Void)?) -> SplashViewController<SplashViewImp>
  func splashDataProvider() -> SplashDataProvider
}

extension Assembly: SplashAssembly {
  func splashCoordinator(onSuccess: (() -> Void)?) -> SplashCoordinator {
    .init(assembly: self, context: .init(onSuccess: onSuccess))

  }

  func splashVC(onSuccess: (() -> Void)?) -> SplashViewController<SplashViewImp> {
    .init(dataProvider: splashDataProvider(), onSuccess: onSuccess)
  }

  func splashDataProvider() -> SplashDataProvider {
    SplashDataProviderImp()
  }
}
