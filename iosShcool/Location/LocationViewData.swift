//
//  LocationViewData.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import Foundation

struct LocationViewData {
  let cellVM: [LocationCellData]

  init(cells: [LocationCellData]) {
    cellVM = cells
  }
}
