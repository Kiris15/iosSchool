//
//  ProfileApiClient.swift
//  iosSchool
//
//  Created by Savely on 30.04.2023.
//

import Foundation

protocol ProfileApiClient {
  func getProfile(profileId: String, onRequestComplited: @escaping (Result<Profile, ApiError>) -> Void)
}

extension ApiClient: ProfileApiClient {
  func getProfile(profileId: String, onRequestComplited: @escaping (Result<Profile, ApiError>) -> Void) {
    let url = NetworkConstants.URLStrings.nanoPost + "v1/profile/\(profileId)"
    performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestComplited)
  }
}
