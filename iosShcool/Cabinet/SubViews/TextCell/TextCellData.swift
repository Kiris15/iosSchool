//
//  TextCellData.swift
//  iosSchool
//
//  Created by Savely on 27.04.2023.
//

import Foundation

struct TextCellData {
  let labelText: String
  let isCircleHiden: Bool

  init(isCircleHiden: Bool, labelText: String) {
    self.isCircleHiden = isCircleHiden
    self.labelText = labelText
  }
}
