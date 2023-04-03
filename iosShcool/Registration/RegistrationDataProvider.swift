//
//  RegistrationDataProvider.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import Foundation

protocol RegistrationDataProvider {
  func registration(
    username: String,
    password: String,
    comletion: @escaping (Result<TokenResponce, ApiError>) -> Void
  )
}

class RegistrationDataProviderImp: RegistrationDataProvider {
  func registration(
    username: String,
    password: String,
    comletion: @escaping (Result<TokenResponce, ApiError>) -> Void
  ) {
    apiClient.registration(username: username, password: password) { result in
      switch result {
      case .success(let data):
        comletion(.success(data))
      case .failure(let error):
        comletion(.failure(error))
      }
    }
  }

  private let apiClient: RegistrationApiClient

  init(apiClient: RegistrationApiClient) {
    self.apiClient = apiClient
  }
}
