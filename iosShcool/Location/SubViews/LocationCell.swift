//
//  LocationCell.swift
//  iosSchool
//
//  Created by Savely on 14.04.2023.
//

import UIKit

class LocationCell: UITableViewCell {

  var viewModel: LocationCellData? {
    didSet {
      update(viewModel)

    }
  }
  @IBOutlet private weak var nameLabel: UILabel!

  private func update(_ viewModel: LocationCellData?) {
    guard let viewModel else {
      return
    }
    nameLabel.text = viewModel.name
  }
}
