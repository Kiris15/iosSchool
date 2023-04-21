//
//  TextFieldСell.swift
//  iosSchool
//
//  Created by Savely on 20.04.2023.
//

import UIKit

class TextFieldCell: UITableViewCell {

  @IBOutlet private weak var dateTextField: UITextField!
  @IBOutlet private weak var profileColorTextField: UITextField!

  func update() {
    dateTextField.backgroundColor = .white.withAlphaComponent(0.6)
    dateTextField.layer.cornerRadius = 15
    dateTextField.layer.masksToBounds = true
    dateTextField.delegate = self

    profileColorTextField.backgroundColor = .white.withAlphaComponent(0.6)
    profileColorTextField.layer.cornerRadius = 15
    profileColorTextField.layer.masksToBounds = true
    profileColorTextField.delegate = self

    dateTextField.delegate = self
    profileColorTextField.delegate = self
    dateTextField.placeholder = "Дата регистрации"
    profileColorTextField.placeholder = "Цвет профиля"

  }
}

extension TextFieldCell: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == dateTextField {
      profileColorTextField.becomeFirstResponder()
    } else {
      profileColorTextField.resignFirstResponder()
    }
    return true
  }
}
