//
//  CabinetView.swift
//  iosSchool
//
//  Created by Savely on 18.04.2023.
//

import UIKit

protocol CabinetView {
  func makeView()
  //func update()
  //func confirmation()
  //func escape()
}

class CabinetViewImp: UIView, CabinetView {

  private var imageView = UIImageView()
  private var tabelView = UITableView()

  func makeView() {
    backgroundColor = .white
    imageView.image = UIImage(named: "CabinetBackground")
    imageView.contentMode = .top
    imageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(imageView)
    imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    tabelView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    addSubview(tabelView)
    tabelView.translatesAutoresizingMaskIntoConstraints = false
    tabelView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    tabelView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    tabelView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    tabelView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    

  }
}
