//
//  CharacterViewController.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import UIKit

class CharacterViewController<View: CharacterView>: BaseViewController<View> {

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

    view.backgroundColor = UIColor(named: "Lilac80")

    rootView.makeViews()
    let data = CharacterViewData(cells: charactersUrlsList.map { CharacterCellData(url: $0) })
    rootView.update(data: data)


    charactersUrlsList.forEach { url in
      requestCharacter(url: url) { [weak self] character in
        print(character)
        guard let self else {
          return
        }
        DispatchQueue.main.async {
          self.rootView.updateCharacter(url: character.url, with: CharacterCellData(
          character: character,
          isLoading: true,
          image: nil
          ))
        }
        self.imageService.getImage(url: character.image) { [weak self] image in
            guard let self else {
              return
            }
            DispatchQueue.main.async {
              self.rootView.updateCharacter(url: character.url, with: CharacterCellData(
              character: character,
              isLoading: false,
              image: image))
            }
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
