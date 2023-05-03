//
//  TextCell.swift
//  iosSchool
//
//  Created by Savely on 23.04.2023.
//

import UIKit

class TextCell: UITableViewCell {

  var viewModel: TextCellData? {
    didSet {
      update(viewModel)
    }
  }

  @IBOutlet private var commonView: UIView!
  @IBOutlet private var textCellLabel: UILabel!
  @IBOutlet private var rightStackView: UIStackView!
  @IBOutlet private var registrationDateLabel: UILabel!
  @IBOutlet private var cabinetColorImage: UIImageView!

  override func awakeFromNib() {
    super.awakeFromNib()

    textCellLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    registrationDateLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    commonView.backgroundColor = .white.withAlphaComponent(0.6)
    commonView.layer.cornerRadius = 15
    commonView.layer.masksToBounds = true
  }

  private func update(_ viewModel: TextCellData?) {
    guard let viewModel = viewModel else {
      return
    }
    registrationDateLabel.isHidden = !viewModel.isCircleHiden
    cabinetColorImage.isHidden = viewModel.isCircleHiden
    textCellLabel.text = viewModel.labelText
    if cabinetColorImage.isHidden == true {
      registrationDateLabel.text = viewModel.entranceDate
    }
  }
}
