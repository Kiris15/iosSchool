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

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.identifier = try container.decode(Int.self, forKey: .identifier)
    self.name = try container.decode(String.self, forKey: .name)
    self.type = (try? container.decode(String.self, forKey: .type)) ?? "no type"
    self.residents = try container.decode([String].self, forKey: .residents)
    self.dim = try container.decode(String.self, forKey: .dim)
  }
}
