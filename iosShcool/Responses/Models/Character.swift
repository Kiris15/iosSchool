//
//  Character.swift
//  iosSchool
//
//  Created by Savely on 30.03.2023.
//

import Foundation

struct Character: Decodable {
  let identifier: Int
  let name: String
  let status: String
  let species: String
  let type: String
  let gender: String

  enum CodingKeys: String, CodingKey {
    case identifier = "id"
    case name
    case status
    case species
    case type
    case gender
  }
}
