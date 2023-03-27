//
//  AuthAssembly.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation

protocol AuthAssembly {

  func authCootdinator() -> AuthCoordinator
  func authVC() -> AuthViewController
  func authDataProvider() -> AuthDataProvider
}

extension Assembly: AuthAssembly {

  func authCootdinator() -> AuthCoordinator {
    AuthCoordinator(assembly: self, context: .init())
  }

  func authVC() -> AuthViewController {
    .init(dataProvider: authDataProvider())
  }

  func authDataProvider() -> AuthDataProvider {
    AuthDataProviderImp(apiClient: apiClient)
  }

}
