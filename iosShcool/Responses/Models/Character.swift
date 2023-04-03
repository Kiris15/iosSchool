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

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.identifier = try container.decode(Int.self, forKey: .identifier)
    self.name = try container.decode(String.self, forKey: .name)
    self.status = try container.decode(String.self, forKey: .status)
    self.species = try container.decode(String.self, forKey: .species)
    self.type = (try? container.decode(String.self, forKey: .type)) ?? "no type"
    self.gender = try container.decode(String.self, forKey: .gender)
  }
}
