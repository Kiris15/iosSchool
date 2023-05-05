//
//  LocationView.swift
//  iosSchool
//
//  Created by Savely on 14.04.2023.
//

import UIKit

protocol LocationsView: UIView {
  func makeView()
  func update(data: LocationViewData)
  var selectLocation: ((LocationCellData) -> Void)? { get set }

  var willDisplayCell: ((IndexPath) -> Void)? { get set }
}

class LocationsViewImp: UIView, LocationsView {

  var selectLocation: ((LocationCellData) -> Void)?
  var willDisplayCell: ((IndexPath) -> Void)?

  private var locationData: LocationViewData?

  private let imageView = UIImageView()
  private let tabelView = UITableView()

  func makeView() {
    backgroundColor = .white
    imageView.image = UIImage(named: "backgroundMain")
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(imageView)
    imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    tabelView.backgroundColor = .clear
    tabelView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    tabelView.dataSource = self
    tabelView.delegate = self
    let nib = UINib(nibName: LocationCell.className, bundle: nil)
    tabelView.register(nib, forCellReuseIdentifier: LocationCell.className)
    addSubview(tabelView)
    tabelView.translatesAutoresizingMaskIntoConstraints = false
    tabelView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    tabelView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    tabelView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    tabelView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  }

  func update(data: LocationViewData) {
    locationData = data

    DispatchQueue.main.async { [weak self] in
      self?.tabelView.reloadData()
    }
  }
}

// MARK: - Extensions

extension LocationsViewImp: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    locationData?.cellVM.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let locationData,
       let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.className) as? LocationCell {
      cell.viewModel = locationData.cellVM[indexPath.row]
      return cell
    }
    return UITableViewCell()
  }
}

extension LocationsViewImp: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let locationData, locationData.cellVM.count > indexPath.row else {
      return
    }
    selectLocation?(locationData.cellVM[indexPath.row])
  }

  func tableView(_ tabelView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    willDisplayCell?(indexPath)
  }
}
