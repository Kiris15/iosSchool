//
//  CabinetImageCell.swift
//  iosSchool
//
//  Created by Savely on 18.04.2023.
//

import UIKit

class CabinetImageCell: UITableViewCell {

  var viewModel: CabinetImageCellData? {
    didSet {
      update(viewModel)
    }
  }

    @IBOutlet private weak var imageViewCabinet: UIImageView!
    @IBOutlet private weak var backgroundImage: UIImageView!

    private func update(_ viewModel: CabinetImageCellData?) {
      guard let viewModel = viewModel else {
        return
      }
      imageViewCabinet.image = viewModel.profileImage
      backgroundImage.image = viewModel.backgroundCabinetImage
    }
}
