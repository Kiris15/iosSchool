//
//  ImageService.swift
//  iosSchool
//
//  Created by Savely on 17.04.2023.
//

import UIKit

protocol ImageService {
  func getImage(url: String, completion: @escaping (UIImage?) -> Void)
}

class ImageServiceImp: ImageService {

  private var imageDict: [String: UIImage] = [:]

  private let apiClient: ApiClient
  private let updateQueue = DispatchQueue(label: "ImageServiceQueu")

  init(apiClient: ApiClient) {
    self.apiClient = apiClient
  }


  func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
  }


}
