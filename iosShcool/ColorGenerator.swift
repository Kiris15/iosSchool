//
//  ColorGenerator.swift
//  iosSchool
//
//  Created by Savely on 13.03.2023.
//

import Foundation

enum Brightness: Double {
  case din = 0.1
  case average = 0.5
  case bright = 1.0

  func description() -> String {
    switch self {
    case .din:
      return "din"
    case .average:
      return "average"
    case .bright:
      return "bright"
    }
  }
}

struct Color {
  let red: Double
  let green: Double
  let blue: Double
  var alpha: Brightness

  func description() {
    print("R: \(red), G: \(green), B: \(blue), alpha: \(alpha.rawValue)")
  }

}
protocol ColorGeneratorProtocol {
  var color: Color {get set}
  
  func generate() -> Color
  init(alpha: Double)
}

class ColorGenerator: ColorGeneratorProtocol {
  
  var color: Color
  
  let colorCods: [Double] = [0.0, 51.0, 102.0, 153.0, 204.0, 255.0]
  var alpha: Double
  
  required init(alpha: Double) {
    self.alpha = alpha
    self.color = Color(red: 1, green: 1, blue: 1, alpha: .bright)
  }
  
  func generate() -> Color {
    return color
    
  }
}

