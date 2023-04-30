//
//  CabinetViewData.swift
//  iosSchool
//
//  Created by Savely on 18.04.2023.
//

import UIKit

struct CabinetViewData {
  let registrationDateText: String
  let profileColorText: String
  let dateOfRegistration: Date
  let colorOfCabinet: UIColor

  init(date: Date, color: UIColor) {
    self.registrationDateText = "Дата регистрации"
    self.profileColorText = "Цвет профиля"
    self.dateOfRegistration = date
    self.colorOfCabinet = color
  }
}
