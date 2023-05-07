//
//  AuthApiClient.swift
//  iosSchool
//
//  Created by Savely on 27.03.2023.
//

import Foundation

protocol AuthApiClient {
  func authorization(
    username: String,
    password: String,
    onRequestComplited: @escaping (Result<TokenResponse, ApiError>) -> Void
  )
}

extension ApiClient: AuthApiClient {
  func authorization(
    username: String,
    password: String,
    onRequestComplited: @escaping (Result<TokenResponse, ApiError>) -> Void
  ) {
    let url = NetworkConstants.URLStrings.nanoPost +
                "/auth/login?username=\(username)&password=\(password)"
    performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestComplited)
  }
}
