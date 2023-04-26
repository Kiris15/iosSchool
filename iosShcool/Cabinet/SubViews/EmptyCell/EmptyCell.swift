//
//  EmptyCell.swift
//  iosSchool
//
//  Created by Savely on 21.04.2023.
//

import UIKit

class EmptyCell: UITableViewCell {

  @IBOutlet weak var heightConstraint: NSLayoutConstraint!

  func update(heightView: CGFloat) {
    heightConstraint.constant = heightView

  }
}
