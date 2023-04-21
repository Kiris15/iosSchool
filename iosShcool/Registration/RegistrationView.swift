//
//  RegistrationView.swift
//  iosSchool
//
//  Created by Savely on 22.03.2023.
//

import UIKit

protocol RegistrationView: UIView {

  var backToAuthorization: (() -> Void)? { get set }
  var delegate: RegistrationViewDelegate? { get set }

  func update(with date: RegistrationViewData)
}

protocol RegistrationViewDelegate: AnyObject {
  func registrConfirmButtonDidTap(
    login: String,
    password: String,
    repeatPassword: String
  )
}

class RegistrationViewImp: UIView, RegistrationView {

  var backToAuthorization: (() -> Void)?

  weak var delegate: RegistrationViewDelegate?

  @IBOutlet private weak var scrollView: UIScrollView!
  @IBOutlet private weak var registrationLabel: UILabel!
  @IBOutlet private weak var registrIcon: UIImageView!
  @IBOutlet private weak var registrLoginTextField: UITextField!
  @IBOutlet private weak var registrPasswordTextField: UITextField!
  @IBOutlet private weak var registrRepeatPasswordTextField: UITextField!
  @IBOutlet private weak var registrConfirmationButton: CustomButton!
  @IBOutlet private weak var registrBackButton: CustomButton!

  deinit {
    NotificationCenter.default.removeObserver(self)
  }

  func update(with date: RegistrationViewData) {
    let recognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
    addGestureRecognizer(recognizer)

    registrLoginTextField.placeholder = date.registrLoginTextFieldPlaceholder
    registrPasswordTextField.placeholder = date.registrPasswordTextFieldPlaceholder
    registrRepeatPasswordTextField.placeholder = date.regRepeatPasswordTextFieldPlaceholder

    registrLoginTextField.backgroundColor = .white.withAlphaComponent(0.6)
    registrLoginTextField.layer.cornerRadius = 15
    registrLoginTextField.layer.masksToBounds = true
    registrLoginTextField.delegate = self

    registrPasswordTextField.backgroundColor = .white.withAlphaComponent(0.6)
    registrPasswordTextField.layer.cornerRadius = 15
    registrPasswordTextField.layer.masksToBounds = true
    registrPasswordTextField.delegate = self

    registrRepeatPasswordTextField.backgroundColor = .white.withAlphaComponent(0.6)
    registrRepeatPasswordTextField.layer.cornerRadius = 15
    registrRepeatPasswordTextField.layer.masksToBounds = true
    registrRepeatPasswordTextField.delegate = self

    makeButton(button: registrConfirmationButton)
    makeButton(button: registrBackButton)

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillShow),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillHide),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
  }

  // MARK: Actions

  @IBAction func registrConfirmButtonDidTap(sender: UIButton) {
    endEditing(true)
    delegate?.registrConfirmButtonDidTap(
      login: registrLoginTextField.text ?? "",
      password: registrPasswordTextField.text ?? "",
      repeatPassword: registrRepeatPasswordTextField.text ?? ""
    )
  }

  @IBAction func registrBackButtonDidTap(sender: UIButton) {
    endEditing(true)
    backToAuthorization?()
  }

  @objc
  private func closeKeyboard() {
    endEditing(true)
  }

  @objc
  private func keyboardWillShow(notification: Notification) {
    guard let userInfo = notification.userInfo else {
      return
    }
    guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
      return
    }
    let keyboardHeight = keyboardFrame.cgRectValue.height
    scrollView.contentInset.bottom = keyboardHeight + 15
    scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
  }

  @objc
  private func keyboardWillHide(notification: Notification) {
    scrollView.contentInset = .zero
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

// MARK: - UITextFieldDelegate

extension RegistrationViewImp: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == registrLoginTextField {
      registrPasswordTextField.becomeFirstResponder()
    } else if textField == registrPasswordTextField {
      registrRepeatPasswordTextField.becomeFirstResponder()
    } else {
      registrRepeatPasswordTextField.resignFirstResponder()
    }
    return true
  }
}
