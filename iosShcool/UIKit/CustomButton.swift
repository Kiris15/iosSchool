//
//  CustomButton.swift
//  iosSchool
//
//  Created by Savely on 31.03.2023.
//

import UIKit

class CustomButton: UIButton {

  override var isHighlighted: Bool {
    didSet {
      self.tintColor = self.isHighlighted ? .black : .white
      self.backgroundColor = self.isHighlighted ? self.highlightColor : self.normalColor
    }
  }

  @IBInspectable
  var highlightColor: UIColor = .white
  @IBInspectable
  var normalColor: UIColor = .white {
    didSet {
      backgroundColor = normalColor
    }
  }
}
