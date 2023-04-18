//
//  RegistrationAssembly.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import Foundation

protocol RegistrationAssembly {

  func registrationCoordinator(onLoginSuccess: (() -> Void)?) -> RegistrationCoordinator
  func registrationVC(onLoginSuccess: (() -> Void)?) -> RegistrationViewController<RegistrationViewImp>
  func registrationDataProvider() -> RegistrationDataProvider
}

extension Assembly: RegistrationAssembly {

  func registrationCoordinator(onLoginSuccess: (() -> Void)?) -> RegistrationCoordinator {
    RegistrationCoordinator(assembly: self, context: .init(onLoginSuccess: onLoginSuccess))
  }

  func registrationVC(onLoginSuccess: (() -> Void)?) -> RegistrationViewController<RegistrationViewImp> {
    .init(dataProvider: registrationDataProvider(), onLoginSuccess: onLoginSuccess)
  }

  func registrationDataProvider() -> RegistrationDataProvider {
    RegistrationDataProviderImp(apiClient: apiClient)
  }
}
