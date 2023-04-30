//
//  LocationApiClient.swift
//  iosSchool
//
//  Created by Savely on 30.03.2023.
//

import Foundation

protocol LocationApiClient {
  func location(onRequestComplited: @escaping (Result<LocationList, ApiError>) -> Void)
  func getLocations(page: Int, onRequestCompleted: @escaping(Result<LocationList, ApiError>) -> Void)
}

extension ApiClient: LocationApiClient {

  func getLocations(page: Int, onRequestCompleted: @escaping(Result<LocationList, ApiError>) -> Void) {
    let url = NetworkConstants.URLStrings.locationURL + "?page=\(page)"
    performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestCompleted)
  }

  func location(onRequestComplited: @escaping (Result<LocationList, ApiError>) -> Void) {
    let url = NetworkConstants.URLStrings.locationURL
    performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestComplited)
  }
}
