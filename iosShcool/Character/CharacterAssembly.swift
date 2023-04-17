//
//  CharacterAssembly.swift
//  iosSchool
//
//  Created by Savely on 03.04.2023.
//

import Foundation

protocol CharacterAssembly {
  func characterCoordinator(viewModel: LocationCellData) -> CharacterCoordinator
  func characterVC(viewModel: LocationCellData) -> CharacterViewController
  func characterDataProvider() -> CharacterDataProvider
}

extension Assembly: CharacterAssembly {

  func characterCoordinator(viewModel: LocationCellData) -> CharacterCoordinator {
    CharacterCoordinator(assembly: self, context: .init(viewModel: viewModel))
  }

  func characterVC(viewModel: LocationCellData) -> CharacterViewController {
    .init(dataProvider: characterDataProvider(), viewModel: viewModel, imageService: imageService)
  }

  func characterDataProvider() -> CharacterDataProvider {
    CharacterDataProviderImp(apiClient: apiClient)
  }
}
