//
//  CabinetCoordinator.swift
//  iosSchool
//
//  Created by Savely on 10.04.2023.
//

import UIKit

class CabinetCoordinator: BaseCoordinator<CabinetCoordinator.Context> {

    struct Context {
    }

    override func make() -> UIViewController {
        let controller = assembly.cabinetVC()
        return controller
    }
}
