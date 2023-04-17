//
//  LocationAssembly.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import Foundation

protocol LocationAssembly {
  func locationCoordinator() -> LocationCoordinator
  func locationVC() -> LocationViewController<LocationsViewImp>
  func locationDataProvider() -> LocationDataProvider
}

extension Assembly: LocationAssembly {

  func locationCoordinator() -> LocationCoordinator {
    LocationCoordinator(assembly: self, context: .init())
  }

  func locationVC() -> LocationViewController<LocationsViewImp> {
    .init(dataProvider: locationDataProvider())
  }

  func locationDataProvider() -> LocationDataProvider {
    LocationDataProviderImp(apiClient: apiClient)
  }
}
