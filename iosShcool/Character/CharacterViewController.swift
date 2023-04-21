//
//  CharacterViewController.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import UIKit

class CharacterViewController: UIViewController {

  private var characters: [Character] = []

  private let charactersUrlsList: [String]
  private let imageService: ImageService
  private let dataProvider: CharacterDataProvider
  private let updateQueue = DispatchQueue(label: "CharacterReqiestQueue")

  init(dataProvider: CharacterDataProvider, viewModel: LocationCellData, imageService: ImageService) {
    charactersUrlsList = viewModel.residents
    self.dataProvider = dataProvider
    self.imageService = imageService

    super.init(nibName: nil, bundle: nil)

    title = "Жители локации \(viewModel.name)"
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

//    dataProvider.character(identifier: 8) { [weak self] resut in
//      switch resut {
//      case .success(let success):
//        print(success)
//      case .failure(let failure):
//        print(failure.rawValue)
//      }
//    }

    charactersUrlsList.forEach { url in
      requestCharacter(url: url) { [weak self] character in
        print(character)
        self?.imageService.getImage(url: character.image) { [weak self] image in
          print(image?.size ?? 0)
        }
      }
    }
  }

  private func requestCharacter(url: String, completion: @escaping (Character) -> Void) {
    if let character = characters.first(where: { $0.url == url }) {
      completion(character)
      return
    }

    DispatchQueue.global().async {
      self.dataProvider.singleCharacter(url: url) { [weak self] result in
        switch result {
        case let.success(character):
          self?.updateQueue.async {
            self?.characters.append(character)
            completion(character)
          }
        case .failure:
          print("character load fall")
        }
      }
    }
  }

}
