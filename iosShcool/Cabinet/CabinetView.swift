//
//  CabinetView.swift
//  iosSchool
//
//  Created by Savely on 18.04.2023.
//

import UIKit

protocol CabinetView: UIView {
  func makeView()
  var delegate: CabinetViewDelegate? { get set }
}

protocol CabinetViewDelegate: AnyObject {
  func escapeButtonDidTap()
}

class CabinetViewImp: UIView, CabinetView {

  weak var delegate: CabinetViewDelegate?

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

    tabelView.backgroundColor = .clear
    tabelView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    tabelView.translatesAutoresizingMaskIntoConstraints = false
    tabelView.topAnchor.constraint(equalTo: topAnchor, constant: 246).isActive = true
    tabelView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    tabelView.bottomAnchor.constraint(equalTo: escapeButton.topAnchor, constant: 122).isActive = true
    tabelView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    tabelView.backgroundColor = UIColor(named: "Lilac50")
    tabelView.separatorStyle = .none
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

    makeImage(image: imageView)
    makeButton(button: escapeButton)

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

  private func makeImage(image: UIImageView) {
    image.image = UIImage(named: "CabinetBackground")
    image.contentMode = .top
    image.translatesAutoresizingMaskIntoConstraints = false
    image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    image.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    image.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    image.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  }

  private func makeButton(button: CustomButton) {
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = UIColor(named: "VelvetBlue")
    button.normalColor = UIColor(named: "VelvetBlue") ?? .white
    button.highlightColor = .white

    button.layer.cornerRadius = 10
    button.layer.borderColor = UIColor(named: "DarkBlue")?.withAlphaComponent(0.22).cgColor
    button.layer.borderWidth = 1
    button.layer.shadowOpacity = 0.25
    button.layer.shadowOffset = CGSize(width: 0, height: 4)
    button.layer.shadowRadius = 4
    button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    button.setTitle("Выйти", for: .normal)
    button.addTarget(self, action: #selector(escapeButtonDidTap), for: .touchUpInside)
  }

  // MARK: ObjFunctions
  @objc func escapeButtonDidTap(sender: UIButton) {
    endEditing(true)
    delegate?.escapeButtonDidTap()
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

// MARK: Extensions
extension CabinetViewImp: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

  }
}

extension CabinetViewImp: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }

  // MARK: TabelViewSet
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
      let cell = tableView.dequeueReusableCell(
        withIdentifier: EmptyCell.className,
        for: indexPath
      )
      return cell
    }
    if indexPath.row == 3 {
    if let cell = tableView.dequeueReusableCell(
      withIdentifier: TextFieldCell.className,
      for: indexPath
    ) as? TextFieldCell {
      cell.update()
        return cell
      }
    }
    return UITableViewCell()
  }
}
