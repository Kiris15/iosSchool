//
//  CharacterCell.swift
//  iosSchool
//
//  Created by Savely on 21.04.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell {

  var viewModel: CharacterCellData? {
    didSet {
      update(viewModel: viewModel)
    }
  }

  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var typeLabel: UILabel!

  private func update(viewModel: CharacterCellData?) {
    guard let viewModel else {
      return
    }
    layer.cornerRadius = 15
    imageView.image = viewModel.isLoading ? UIImage(named: "CharacterPlaseholder") : viewModel.image
    nameLabel.text = viewModel.name
    guard let type = viewModel.type else {
      return
    }
    guard let gender = viewModel.gender else {
      return
    }
    typeLabel.text = "\(type) \(gender)"
  }
}
