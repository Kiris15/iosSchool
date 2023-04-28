//
//  LocationViewController.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import UIKit
import PKHUD
import SPIndicator

class LocationViewController<View: LocationsView>: BaseViewController<View> {

  var selectLocation: ((LocationCellData) -> Void)?
  var page: Int = 1
  var cellVM: [LocationCellData] = []
  var pagesLimited: Bool = false
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
    rootView.willDisplayCell = { [weak self] indexPath in
      guard let self,
            self.cellVM.count > 0,
            self.cellVM.count / 2 == indexPath.row
      else {
        return
      }
      self.page += 1
      self.loadPage(self.page)
    }

    HUD.show(.progress)
    loadPage(page)

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
  @objc private func reload() {
    page = 1
    cellVM = []
    pagesLimited = false
    rootView.update(data: .init(cells: cellVM))

    HUD.show(.progress)
    loadPage(page)

  }

  private func loadPage(_ page: Int) {
    guard !pagesLimited else {
      return
    }
    dataProvider.locations(page: page) { [weak self] resut in
      guard let self else {
        return
      }
      DispatchQueue.main.async {
        HUD.hide()
      }

      switch resut {
      case .success(let data):
        DispatchQueue.main.async {
          let newCells = data.results.map { LocationCellData(
            location: $0,
            population: "Население \($0.residents.count)"
          )}
          self.cellVM.append(contentsOf: newCells)
          self.rootView.update(data: .init(cells: self.cellVM))
          self.pagesLimited = self.page == data.info.pages
          if self.page < data.info.pages {
            self.page += 1
          }
        }
      case .failure(let failure):
        DispatchQueue.main.async {
          SPIndicator.present(title: failure.rawValue, preset: .error, haptic: .error)
        }
        print(failure.rawValue)
      }
    }
  }
}
