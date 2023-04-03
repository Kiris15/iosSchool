//
//  LocationCoordinator.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import UIKit

class LocationCoordinator: BaseCoordinator<LocationCoordinator.Context> {

  struct Context {
  }

  override func make() -> UIViewController {
    let controller = assembly.locationVC()
    return controller
  }
}
