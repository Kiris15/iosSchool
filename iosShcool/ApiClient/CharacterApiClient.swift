//
//  CharacterApiClient.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import Foundation

protocol CharacterApiClient {
  func character(
    identifier: Int,
    onRequestComplited: @escaping (Result<Character, ApiError>) -> Void
  )
}

extension ApiClient: CharacterApiClient {
  func character(
    identifier: Int,
    onRequestComplited: @escaping (Result<Character, ApiError>) -> Void
  ) {
    let url = NetworkConstants.URLStrings.characterURL + "\(identifier)"
    performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestComplited)
  }
}
