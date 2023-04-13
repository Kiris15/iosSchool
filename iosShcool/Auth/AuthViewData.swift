//
//  AuthViewData.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation

struct AuthViewData {

  let loginTextFieldPlaceholder: String
  let passwordTextFieldPlaceholder: String

  init() {
    loginTextFieldPlaceholder = "Логин"
    passwordTextFieldPlaceholder = "Пароль"
  }
}
