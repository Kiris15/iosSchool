//
//  CabinetView.swift
//  iosSchool
//
//  Created by Savely on 18.04.2023.
//

import UIKit

protocol CabinetView: UIView {
  var delegate: CabinetViewDelegate? { get set }
  var cabinetData: CabinetViewData? { get set }

  func makeView()
}

protocol CabinetViewDelegate: AnyObject {
  func escapeButtonDidTap()
}

class CabinetViewImp: UIView, CabinetView {

  weak var delegate: CabinetViewDelegate?

  var cabinetData: CabinetViewData?

  private let backgroundView = UIView()
  private var tabelView = UITableView()
  private let escapeButton = CustomButton(configuration: .plain())

  func makeView() {

    backgroundColor = .white

    backgroundView.backgroundColor = UIColor(named: "Lilac80")
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(backgroundView)
    backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    tabelView.backgroundColor = .clear
    tabelView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
    tabelView.translatesAutoresizingMaskIntoConstraints = false
    tabelView.separatorStyle = .none
    tabelView.delegate = self
    tabelView.dataSource = self
    tabelView.allowsFocus = false
    tabelView.allowsSelection = false
    tabelView.contentInsetAdjustmentBehavior = .never

    let imageNib = UINib(nibName: CabinetImageCell.className, bundle: nil)
    tabelView.register(imageNib, forCellReuseIdentifier: CabinetImageCell.className)
    let labelNib = UINib(nibName: LabelCell.className, bundle: nil)
    tabelView.register(labelNib, forCellReuseIdentifier: LabelCell.className)
    let textNib = UINib(nibName: TextCell.className, bundle: nil)
    tabelView.register(textNib, forCellReuseIdentifier: TextCell.className)
    let emptyNib = UINib(nibName: EmptyCell.className, bundle: nil)
    tabelView.register(emptyNib, forCellReuseIdentifier: EmptyCell.className)
    addSubview(tabelView)

    tabelView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    tabelView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    tabelView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    makeButton(button: escapeButton)
  }

  private func makeButton(button: CustomButton) {

    button.translatesAutoresizingMaskIntoConstraints = false
    button.normalColor = UIColor(named: "VelvetBlue") ?? .white
    button.setTitle("Выйти", for: .normal)
    button.addTarget(self, action: #selector(escapeButtonDidTap), for: .touchUpInside)
    button.tintColor = .white
    button.layer.cornerRadius = 10
    button.layer.borderColor = UIColor(named: "DarkBlue")?.withAlphaComponent(0.22).cgColor
    button.layer.borderWidth = 1
    button.layer.shadowOpacity = 0.25
    button.layer.shadowOffset = CGSize(width: 0, height: 4)
    button.layer.shadowRadius = 4
    addSubview(escapeButton)

    button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    button.topAnchor.constraint(equalTo: tabelView.bottomAnchor).isActive = true
    button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

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

  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    guard let cabinetData = cabinetData else {
      return UITableViewCell()
    }
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: CabinetImageCell.className, for: indexPath)
      return cell
    case  1:
      if let cell = tableView.dequeueReusableCell(
        withIdentifier: LabelCell.className,
        for: indexPath
      ) as? LabelCell {
        let viewModel = LabelCellData(login: cabinetData.userName)
        cell.viewModel = viewModel
        return cell
      }
    case 2:
      if let cell = tableView.dequeueReusableCell(
        withIdentifier: EmptyCell.className,
        for: indexPath
      ) as? EmptyCell {
        var heigthView: CGFloat = 80
        if UIScreen.main.bounds.height < 668 {
          heigthView = 15
        }
        cell.update(heightView: heigthView)
        return cell
      }
    case 3:
      if let cell = tableView.dequeueReusableCell(
        withIdentifier: TextCell.className,
        for: indexPath
      ) as? TextCell {
        let viewModel = TextCellData(
          isCircleHiden: true,
          labelText: cabinetData.registrationDateText,
          entranceDate: cabinetData.dateOfLastEntrance
        )
        cell.viewModel = viewModel
        return cell
      }
    case 4:
      if let cell = tableView.dequeueReusableCell(
        withIdentifier: TextCell.className,
        for: indexPath
      ) as? TextCell {
        let viewModel = TextCellData(
          isCircleHiden: false,
          labelText: cabinetData.profileColorText,
          entranceDate: ""
        )
        cell.viewModel = viewModel
        return cell
      }
    default:
      return UITableViewCell()
    }
    return UITableViewCell()
  }
}
