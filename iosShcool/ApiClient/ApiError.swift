//
//  ApiError.swift
//  iosSchool
//
//  Created by Savely on 27.03.2023.
//

import Foundation

enum ApiError: Error {
  case dataParsing
  case serverError
  case `dafault`(Data?)

  var rawValue: String {
    switch self {
    case .dataParsing:
      return "Ошибка парсинга"
    case .serverError:
      return "Ошибка получения данных"
    case let .dafault(error):
      if let error {
        return String(decoding: error, as: UTF8.self)
      } else {
        return "Неизвестная ошибка"
      }
    }
  }
}
