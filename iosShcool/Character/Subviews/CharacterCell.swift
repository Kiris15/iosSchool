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

  private func update(viewModel: CharacterCellData?) {
    guard let viewModel else {
      return
    }
    layer.cornerRadius = 15
    //contentView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
    imageView.image = viewModel.isLoading ? UIImage(named: "CharacterPlaseholder") : viewModel.image
    nameLabel.text = viewModel.name
  }
}
