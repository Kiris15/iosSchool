//
//  CabinetCoordinator.swift
//  iosSchool
//
//  Created by Savely on 10.04.2023.
//

import UIKit

class CabinetCoordinator: BaseCoordinator<CabinetCoordinator.Context> {

  struct Context {
    let escapeToAuth: (() -> Void)?
  }

  override func make() -> UIViewController {
    let controller = assembly.cabinetVC(escapeToAuth: context.escapeToAuth)
    return controller
  }
}
