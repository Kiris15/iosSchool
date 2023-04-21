//
//  LocationViewData.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import Foundation

struct LocationViewData {
  let cellVM: [LocationCellData]

  init(locations: LocationList) {

    cellVM = locations.results.map { LocationCellData(
      location: $0,
      population: "Население \($0.residents.count)"
    )}
  }
}
