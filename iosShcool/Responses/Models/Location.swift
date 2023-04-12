//
//  Location.swift
//  iosSchool
//
//  Created by Savely on 27.03.2023.
//

import Foundation

struct Location: Decodable {
  let identifier: Int
  let name: String
  let type: String
  let residents: [String]
  let dim: String

  enum CodingKeys: String, CodingKey {
    case identifier = "id"
    case name
    case type
    case residents
    case dim = "dimention"
  }
}
