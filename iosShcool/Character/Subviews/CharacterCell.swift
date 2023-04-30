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
  @IBOutlet private weak var systemHud: UIActivityIndicatorView!

  private func update(viewModel: CharacterCellData?) {
    guard let viewModel else {
      return
    }
    layer.cornerRadius = 15
    imageView.image = viewModel.isLoading ? UIImage(named: "CharacterPlaseholder") : viewModel.image
    systemHud.isHidden = !viewModel.isLoading
    nameLabel.text = viewModel.name
    typeLabel.text = viewModel.typeGender
  }
}
