//
//  RegistrationApiClient.swift
//  iosSchool
//
//  Created by Savely on 30.03.2023.
//

import Foundation

protocol RegistrationApiClient {
  func registration(
    username: String,
    password: String,
    onRequestComplited: @escaping (Result<TokenResponse, ApiError>) -> Void
  )
}

extension ApiClient: RegistrationApiClient {
  func registration(
    username: String,
    password: String,
    onRequestComplited: @escaping (Result<TokenResponse, ApiError>) -> Void
  ) {
    let url = NetworkConstants.URLStrings.nanoPost + "auth/register"
    let jsonData = try? JSONSerialization.data(withJSONObject: ["username": username, "password": password])
    performRequest(url: url, data: jsonData, method: .post, onRequestCompleted: onRequestComplited)
  }
}
