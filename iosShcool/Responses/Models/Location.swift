//
//  Location.swift
//  iosSchool
//
//  Created by Savely on 27.03.2023.
//

import Foundation

struct Info: Decodable {
  let count: Int
  let pages: Int
  let next: String?
  let prev: String?

  enum CodingKeys: String, CodingKey {
    case count
    case pages
    case next
    case prev
  }
}

struct Location: Decodable {
  let identifier: Int
  let name: String
  let type: String
  let dim: String
  let residents: [String]

  enum CodingKeys: String, CodingKey {
    case identifier = "id"
    case name
    case type
    case dim = "dimension"
    case residents
  }
}

struct LocationList: Decodable {
  let info: Info
  let results: [Location]
}
