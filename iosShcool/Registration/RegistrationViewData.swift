//
//  RegistrationViewData.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import Foundation

struct RegistrationViewData {

  let registrLoginTextFieldPlaceholder: String
  let registrPasswordTextFieldPlaceholder: String
  let regRepeatPasswordTextFieldPlaceholder: String

  init() {
    registrLoginTextFieldPlaceholder = "Введите логин"
    registrPasswordTextFieldPlaceholder = "Введите пароль"
    regRepeatPasswordTextFieldPlaceholder = "Повторите пароль"
    }
}
