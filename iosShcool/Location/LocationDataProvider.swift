//
//  LocationDataProvider.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import Foundation

protocol LocationDataProvider {
  func locations(page: Int, comletion: @escaping (Result<LocationList, ApiError>) -> Void)
}

class LocationDataProviderImp: LocationDataProvider {

  func locations(page: Int, comletion: @escaping (Result<LocationList, ApiError>) -> Void) {
    apiClient.getLocations(page: page) { result in
      switch result {
      case .success(let data):
        comletion(.success(data))
      case .failure(let error):
        comletion(.failure(error))
      }
    }
  }

  private let apiClient: LocationApiClient

  init(apiClient: LocationApiClient) {
    self.apiClient = apiClient
  }
}
