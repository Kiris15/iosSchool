//
//  TextFieldell.swift
//  iosSchool
//
//  Created by Savely on 20.04.2023.
//

import UIKit

class TextFieldCell: UITableViewCell {

  var viewModel: TextFieldCellData? {
    didSet {
      update(viewModel)

    }
  }

  @IBOutlet private weak var dateTextField: UITextField!
  @IBOutlet private weak var profileColorTextField: UITextField!

  private func update(_ viewModel: TextFieldCellData?) {

    dateTextField.placeholder = viewModel?.dateTextFieldPlaceholder
    profileColorTextField.placeholder = viewModel?.profileColorTextFieldPlaceholder
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
