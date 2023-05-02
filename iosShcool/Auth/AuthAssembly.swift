//
//  AuthAssembly.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation

protocol AuthAssembly {

  func authCoordinator(onLoginSuccess: ((String) -> Void)?) -> AuthCoordinator
  func authVC(onLoginSuccess: ((String) -> Void)?) -> AuthViewController<AuthViewImp>
  func authDataProvider() -> AuthDataProvider
}

extension Assembly: AuthAssembly {

  func authCoordinator(onLoginSuccess: ((String) -> Void)?) -> AuthCoordinator {
    AuthCoordinator(assembly: self, context: .init(onLoginSuccess: onLoginSuccess))
  }

  func authVC(onLoginSuccess: ((String) -> Void)?) -> AuthViewController<AuthViewImp> {
    .init(dataProvider: authDataProvider(), storageManager: storageManager, onLoginSuccess: onLoginSuccess)
  }

  func authDataProvider() -> AuthDataProvider {
    AuthDataProviderImp(apiClient: apiClient)
  }
}
