//
//  AuthDataProvider.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation

protocol AuthDataProvider {
  func authorization(
    username: String,
    password: String,
    comletion: @escaping (Result<TokenResponce, ApiError>) -> Void
  )
}

class AuthDataProviderImp: AuthDataProvider {
  func authorization(
    username: String,
    password: String,
    comletion: @escaping (Result<TokenResponce, ApiError>) -> Void
  ) {
    apiClient.authorization(username: username, password: password) { result in
      switch result {
      case .success(let data):
        comletion(.success(data))
      case .failure(let error):
        comletion(.failure(error))
      }
    }
  }

  private let apiClient: AuthApiClient

  init(apiClient: AuthApiClient) {
    self.apiClient = apiClient
  }

}
