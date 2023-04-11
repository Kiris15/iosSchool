//
//  RegistrationAssembly.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import Foundation

protocol RegistrationAssembly {
  func registrationCoordinator() -> RegistrationCoordinator
  func registrationVC() -> RegistrationViewController
  func registrationDataProvider() -> RegistrationDataProvider
}

extension Assembly: RegistrationAssembly {

  func registrationCoordinator() -> RegistrationCoordinator {
    RegistrationCoordinator(assembly: self, context: .init())
  }

  func registrationVC() -> RegistrationViewController {
    .init(dataProvider: registrationDataProvider())
  }

  func registrationDataProvider() -> RegistrationDataProvider {
    RegistrationDataProviderImp(apiClient: apiClient)
  }
}
