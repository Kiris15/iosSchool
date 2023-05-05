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
  @IBOutlet private weak var typeLabel: UILabel!
  @IBOutlet private weak var populationLabel: UILabel!
  @IBOutlet private weak var imageVector: UIImageView!

  private func update(_ viewModel: LocationCellData?) {
    guard let viewModel else {
      return
    }
    nameLabel.text = viewModel.name
    typeLabel.text = viewModel.type
    populationLabel.text = viewModel.population
  }
}
