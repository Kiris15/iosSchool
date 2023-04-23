//
//  TextCell.swift
//  iosSchool
//
//  Created by Savely on 23.04.2023.
//

import UIKit

class TextCell: UITableViewCell {

  @IBOutlet private var commonView: UIView!
  @IBOutlet private var textCellLabel: UILabel!
  @IBOutlet private var rightStackView: UIStackView!
  @IBOutlet private var registrationDateLabel: UILabel!
  @IBOutlet private var cabinetColorImage: UIImageView!

  func update(isCircleHiden: Bool, textLabel: String) {
    textCellLabel.text = textLabel
    textCellLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    registrationDateLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    commonView.backgroundColor = .white.withAlphaComponent(0.6)
    commonView.layer.cornerRadius = 15
    commonView.layer.masksToBounds = true

    if isCircleHiden == true {
      cabinetColorImage.isHidden = true
    } else {
      registrationDateLabel.isHidden = true
    }
  }
}
