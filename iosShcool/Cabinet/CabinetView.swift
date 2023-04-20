//
//  CabinetView.swift
//  iosSchool
//
//  Created by Savely on 18.04.2023.
//

import UIKit

protocol CabinetView: UIView {
  func makeView()
}

class CabinetViewImp: UIView, CabinetView {

  private var imageView = UIImageView()
  private var tabelView = UITableView()
  private let escapeButton = CustomButton()

  deinit {
    Foundation.NotificationCenter.default.removeObserver(self)
  }

  func makeView() {

    addSubview(imageView)
    addSubview(tabelView)
    addSubview(escapeButton)

    backgroundColor = .white
    imageView.image = UIImage(named: "CabinetBackground")
    imageView.contentMode = .top
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    tabelView.backgroundColor = .clear
    tabelView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    tabelView.backgroundColor = UIColor(named: "Lilac50")
    tabelView.translatesAutoresizingMaskIntoConstraints = false
    tabelView.topAnchor.constraint(equalTo: topAnchor, constant: 246).isActive = true
    tabelView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    tabelView.bottomAnchor.constraint(equalTo: escapeButton.topAnchor, constant: 122).isActive = true
    tabelView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    tabelView.delegate = self
    tabelView.dataSource = self
    tabelView.allowsFocus = false
    tabelView.allowsSelection = false
    let imageNib = UINib(nibName: CabinetImageCell.className, bundle: nil)
    tabelView.register(imageNib, forCellReuseIdentifier: CabinetImageCell.className)
    let labelNib = UINib(nibName: LabelCell.className, bundle: nil)
    tabelView.register(labelNib, forCellReuseIdentifier: LabelCell.className)
    let texFieldNib = UINib(nibName: TextFieldCell.className, bundle: nil)
    tabelView.register(texFieldNib, forCellReuseIdentifier: TextFieldCell.className)
    let emptyNib = UINib(nibName: EmptyCell.className, bundle: nil)
    tabelView.register(emptyNib, forCellReuseIdentifier: EmptyCell.className)

    escapeButton.translatesAutoresizingMaskIntoConstraints = false
    escapeButton.backgroundColor = UIColor(named: "VelvetBlue")
    escapeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    escapeButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    escapeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    escapeButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    escapeButton.setTitle("Выйти", for: .normal)
    escapeButton.addTarget(self, action: #selector(escapeButtonDidTap), for: .touchUpInside)

    let recognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
    addGestureRecognizer(recognizer)

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

  @objc func escapeButtonDidTap(sender: UIButton) {
    endEditing(true)
    print("разлогин")
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
    tabelView.contentInset.bottom = keyboardHeight + 15
    tabelView.verticalScrollIndicatorInsets.bottom = keyboardHeight
  }

  @objc
  private func keyboardWillHide(notification: Notification) {
    tabelView.contentInset = .zero
  }

}

extension CabinetViewImp: UITableViewDelegate {

}

extension CabinetViewImp: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: CabinetImageCell.className, for: indexPath)
      return cell
    }
    if indexPath.row == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: LabelCell.className, for: indexPath)
      return cell
    }
    if indexPath.row == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: EmptyCell.className, for: indexPath)
      return cell
    }
    if indexPath.row == 3 {
    if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.className, for: indexPath) as? TextFieldCell {
        return cell
      }
    }
    return UITableViewCell()
  }
}
