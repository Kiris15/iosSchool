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
  let colorOfCabinet: UIColor
  let userName: String
  let dateOfLastEntrance: String

  init(color: UIColor, userName: String, dateOfLastEntrance: String) {
    self.registrationDateText = "Дата регистрации"
    self.profileColorText = "Цвет профиля"
    self.colorOfCabinet = color
    self.userName = userName
    self.dateOfLastEntrance = dateOfLastEntrance
    
  }
}
