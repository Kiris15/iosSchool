//
//  SplashViewController.swift
//  iosSchool
//
//  Created by Savely on 20.03.2023.
//

import Foundation

import UIKit

class SplashViewController: UIViewController {

    private let dataProvider: SplashDataProvider

    init(dataProvider: SplashDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }
}
