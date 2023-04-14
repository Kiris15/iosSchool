//
//  LocationViewController.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import UIKit

class LocationViewController<View: LocationsView>: BaseViewController<View> {

  var selectLocation: ((LocationCellData) -> Void)?
  private let dataProvider: LocationDataProvider

  init(dataProvider: LocationDataProvider) {
    self.dataProvider = dataProvider

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupBar()
    rootView.makeView()
    rootView.selectLocation =  selectLocation

    dataProvider.location() { [weak self] resut in
      switch resut {
      case .success(let data):
        self?.rootView.update(data: LocationViewData(locations: data))
      case .failure(let failure):
        print(failure.rawValue)
      }
    }
  }
  private func setupBar() {
          title = "Выбор планеты"
          navigationController?.navigationBar.titleTextAttributes = [
              .foregroundColor: UIColor(named: "DarkBlue") ?? .black,
              .font: UIFont.systemFont(ofSize: 18)
          ]
          navigationItem.rightBarButtonItem = UIBarButtonItem(
              barButtonSystemItem: .refresh,
              target: self,
              action: #selector(reload)
          )
      }
  @objc private func reload() {}
}

