//
//  CharacterCellData.swift
//  iosSchool
//
//  Created by Savely on 21.04.2023.
//

import UIKit

struct CharacterCellData {
  let url: String
  let isLoading: Bool
  let imageUrl: String?
  let image: UIImage?
  let name: String?
  let typeGender: String

  init(url: String) {
    self.url = url
    isLoading = true
    imageUrl = nil
    image = nil
    name = nil
    typeGender = ""
  }

  init(character: Character, isLoading: Bool, image: UIImage?) {
    url = character.url
    self.isLoading = isLoading
    imageUrl = character.image
    self.image = image
    name = character.name
    typeGender = character.species + " " + character.gender
  }
}
