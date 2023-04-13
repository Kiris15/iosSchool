//
//  RegistrationView.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import UIKit

protocol RegistrationView: UIView {

  var backToAuthorization: (() -> Void)? { get set }

  func update(with date: RegistrationViewData)
}

class RegistrationViewImp: UIView, RegistrationView {

  var backToAuthorization: (() -> Void)?

  @IBOutlet private weak var registrationLabel: UILabel!
  @IBOutlet private weak var registrIcon: UIImageView!
  @IBOutlet private weak var registrLoginTextField: UITextField!
  @IBOutlet private weak var registrPasswordTextField: UITextField!
  @IBOutlet private weak var registrRepeatPasswordTextField: UITextField!
  @IBOutlet private weak var registrConfirmationButton: CustomButton!
  @IBOutlet private weak var registrBackButton: CustomButton!

  func update(with date: RegistrationViewData) {
    registrLoginTextField.placeholder = date.registrLoginTextFieldPlaceholder
    registrPasswordTextField.placeholder = date.registrPasswordTextFieldPlaceholder
    registrRepeatPasswordTextField.placeholder = date.regRepeatPasswordTextFieldPlaceholder

    registrLoginTextField.backgroundColor = .white.withAlphaComponent(0.6)
    registrLoginTextField.layer.cornerRadius = 15
    registrLoginTextField.layer.masksToBounds = true

    registrPasswordTextField.backgroundColor = .white.withAlphaComponent(0.6)
    registrPasswordTextField.layer.cornerRadius = 15
    registrPasswordTextField.layer.masksToBounds = true

    registrRepeatPasswordTextField.backgroundColor = .white.withAlphaComponent(0.6)
    registrRepeatPasswordTextField.layer.cornerRadius = 15
    registrRepeatPasswordTextField.layer.masksToBounds = true

    makeButton(button: registrConfirmationButton)
    makeButton(button: registrBackButton)

  }

  // MARK: Actions

@IBAction func registrConfirmationButton(sender: UIButton) {
}

@IBAction func registrBackButton(sender: UIButton) {
  backToAuthorization?()
}

// MARK: - Private methods

  private func makeButton(button: CustomButton) {
    button.normalColor = UIColor(named: "VelvetBlue") ?? .white
    button.highlightColor = .white

    button.layer.cornerRadius = 10
    button.layer.borderColor = UIColor(named: "DarkBlue")?.withAlphaComponent(0.22).cgColor
    button.layer.borderWidth = 1
    button.layer.shadowOpacity = 0.25
    button.layer.shadowOffset = CGSize(width: 0, height: 4)
    button.layer.shadowRadius = 4
  }
}
