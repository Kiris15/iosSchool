//
//  AuthAssembly.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation

protocol AuthAssembly {

  func authCoordinator() -> AuthCoordinator
  func authVC() -> AuthViewController<AuthViewImp>
  func authDataProvider() -> AuthDataProvider
}

extension Assembly: AuthAssembly {

  func authCoordinator() -> AuthCoordinator {
    AuthCoordinator(assembly: self, context: .init())
  }

  func authVC() -> AuthViewController<AuthViewImp> {
    .init(dataProvider: authDataProvider())
  }

  func authDataProvider() -> AuthDataProvider {
    AuthDataProviderImp(apiClient: apiClient)
  }

}
