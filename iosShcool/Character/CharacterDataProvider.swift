//
//  CharacterDataProvider.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import Foundation

protocol CharacterDataProvider {
  func character(
    identifier: Int,
    comletion: @escaping (Result<Character, ApiError>) -> Void
  )
}

class CharacterDataProviderImp: CharacterDataProvider {
  func character(
    identifier: Int,
    comletion: @escaping (Result<Character, ApiError>) -> Void
  ) {
    apiClient.character(identifier: identifier) { result in
      switch result {
      case .success(let data):
        comletion(.success(data))
      case .failure(let error):
        comletion(.failure(error))
      }
    }
  }

  private let apiClient: CharacterApiClient

  init(apiClient: CharacterApiClient) {
    self.apiClient = apiClient
  }
}
