//
//  ImageService.swift
//  iosSchool
//
//  Created by Savely on 17.04.2023.
//

import UIKit

protocol ImageService {
  func getImage(
    url: String,
    completion: @escaping (UIImage?) -> Void
  )
}

class ImageServiceImp: ImageService {

  private var imageDict: [String: UIImage] = [:]

  private let apiClient: ApiClient
  //  private let updateQueue = DispatchQueue(label: "ImageServiceQueu")

  init(apiClient: ApiClient) {
    self.apiClient = apiClient
  }

  func getImage(
    url: String,
    completion: @escaping (UIImage?) -> Void
  ) {
    if let image = imageDict[url] {
      completion(image)
    }
    //    updateQueue.async {
    self.apiClient.requestImageData(url: url) { data in
      guard let data = data else {
        return
      }
      let image = UIImage(data: data)

      self.imageDict[url] = image
      if self.imageDict.count > 50 {
        let _: () = self.imageDict.removeAll()
      }
      completion(image)
    }
  }
}
