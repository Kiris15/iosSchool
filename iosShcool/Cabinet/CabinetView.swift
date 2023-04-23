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

  private var tabelView = UITableView()
  private let escapeButton = CustomButton(configuration: .plain())

  func makeView() {

    addSubview(tabelView)
    addSubview(escapeButton)

    backgroundColor = .white

    tabelView.backgroundColor = .clear
    tabelView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
    tabelView.translatesAutoresizingMaskIntoConstraints = false
    tabelView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
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
    let textNib = UINib(nibName: TextCell.className, bundle: nil)
    tabelView.register(textNib, forCellReuseIdentifier: TextCell.className)
    let emptyNib = UINib(nibName: EmptyCell.className, bundle: nil)
    tabelView.register(emptyNib, forCellReuseIdentifier: EmptyCell.className)

    makeButton(button: escapeButton)
  }

  private func makeButton(button: CustomButton) {
    button.translatesAutoresizingMaskIntoConstraints = false
    button.normalColor = UIColor(named: "VelvetBlue") ?? .white

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
    button.tintColor = .white
  }

  // MARK: - ObjFunctions
  @objc func escapeButtonDidTap(sender: UIButton) {
    delegate?.escapeButtonDidTap()
  }
}

// MARK: - Extensions
extension CabinetViewImp: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

  }
}

extension CabinetViewImp: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }

  // MARK: - TabelViewSet
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
      withIdentifier: TextCell.className,
      for: indexPath
    ) as? TextCell {
      cell.update(isCircleHiden: true, textLabel: "Дата регистрации")
        return cell
      }
    }
    if indexPath.row == 4 {
    if let cell = tableView.dequeueReusableCell(
      withIdentifier: TextCell.className,
      for: indexPath
    ) as? TextCell {
      cell.update(isCircleHiden: false, textLabel: "Цвет профиля")
        return cell
      }
    }
    return UITableViewCell()
  }
}
