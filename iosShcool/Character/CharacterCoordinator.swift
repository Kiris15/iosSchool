//
//  CharacterCoordinator.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import UIKit

class CharacterCoordinator: BaseCoordinator<CharacterCoordinator.Context> {

  struct Context {
    let viewModel: LocationCellData
  }

  override func make() -> UIViewController {
    let controller = assembly.characterVC(viewModel: context.viewModel)
    return controller
  }
}
