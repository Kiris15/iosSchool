//
//  CabinetImageCellData.swift
//  iosSchool
//
//  Created by Savely on 27.04.2023.
//

import UIKit

struct CabinetImageCellData {
  let profileImage: UIImage?
  let backgroundCabinetImage: UIImage?

  init() {
    self.profileImage = profileImage
    self.backgroundCabinetImage = UIImage(named: "CabinetBackground")
  }
}
