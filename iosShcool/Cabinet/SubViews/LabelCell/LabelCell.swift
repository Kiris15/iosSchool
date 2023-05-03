//
//  LabelCell.swift
//  iosSchool
//
//  Created by Savely on 21.04.2023.
//

import UIKit

class LabelCell: UITableViewCell {

  var viewModel: LabelCellData? {
    didSet {
      update(viewModel)
    }
  }

  @IBOutlet private weak var loginLabel: UILabel!

  private func update(_ viewModel: LabelCellData?) {
    guard let viewModel = viewModel else {
      return
    }
    loginLabel.text = viewModel.loginLabel
  }
}
