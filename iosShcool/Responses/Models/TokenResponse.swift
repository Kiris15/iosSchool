//
//  TokenResponse.swift
//  iosSchool
//
//  Created by Savely on 27.03.2023.
//

import Foundation

struct TokenResponse: Decodable {
  let token: String
  let userId: String
}
