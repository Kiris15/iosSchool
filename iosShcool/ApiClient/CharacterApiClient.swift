//
//  CharacterApiClient.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import Foundation

protocol CharacterApiClient {
  func character(onRequestComplited: @escaping (Result<Character, ApiError>) -> Void)
}

extension ApiClient: CharacterApiClient {
  func character(onRequestComplited: @escaping (Result<Character, ApiError>) -> Void) {
    let url = NetworkConstants.URLStrings.characterURL
    performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestComplited)
  }
}
