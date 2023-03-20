//
//  BaseCoordinator.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation
import UIKit

class BaseCoordinator<Context> {

  let assembly: Assembly
  let context: Context

  init(assembly: Assembly, context: Context) {
    self.assembly = assembly
    self.context = context
  }

  func make() -> UIViewController {
    fatalError("method is abstract")
  }
}
