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
  func singleCharacter(
          url: String,
          completion: @escaping (Result<Character, ApiError>) -> Void
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

  func singleCharacter(
          url: String,
          completion onRequestCompleted: @escaping (Result<Character, ApiError>) -> Void
      ) {
          performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestCompleted)
      }
}
