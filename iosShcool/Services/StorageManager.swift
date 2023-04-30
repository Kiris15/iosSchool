//
//  StorageManager.swift
//  iosSchool
//
//  Created by Savely on 24.04.2023.
//

import Foundation
import KeychainAccess

protocol StorageManager {
  func cleanKeychainIfNeeded()
  func saveToken(token: TokenResponce?)
  func getToken() -> TokenResponce?
  func removeToken()

  func saveUsername(username: Profile?)
  func getUsername() -> Profile?
  func removeUsername()
}

class StorageManagerImp: StorageManager {

  private let keychain = Keychain(service: Constants.serviceId)

  func cleanKeychainIfNeeded() {
    guard !notFirstLaunch() else {
      return
    }
    notFirstLaunch()

    do {
      try keychain.removeAll()
      if let appDomain = Bundle.main.bundleIdentifier {
      UserDefaults.standard.removePersistentDomain(forName: appDomain)
       }
    } catch {
      print(error as Any)
    }
  }
  func saveToken(token: TokenResponce?) {
    guard let token else {
      return
    }

    do {
      try keychain.set(token.token, key: StorageManagerKey.token.rawValue)
      try keychain.set(token.userId, key: StorageManagerKey.userId.rawValue)
    } catch {
      print(error as Any)
    }
  }

  func getToken() -> TokenResponce? {

    do {
      guard let token = try keychain.get(StorageManagerKey.token.rawValue),
            let userId = try keychain.get(StorageManagerKey.userId.rawValue) else {
        return nil
      }
      return TokenResponce(token: token, userId: userId)
    } catch {
      print(error as Any)
    }
    return nil
  }

  func removeToken() {
    do {
      try keychain.remove(StorageManagerKey.token.rawValue)
      try keychain.remove(StorageManagerKey.userId.rawValue)
    } catch {
      print(error as Any)
    }
  }
  // MARK: - SaveUsername

  func saveUsername(username: Profile?) {
    guard let username else {
      return
    }
    do {
      try keychain.set(username.username, key: StorageManagerKey.username.rawValue)
    } catch {
      print(error as Any)
    }
  }

  func getUsername() -> Profile? {
    do {
      guard let username = try keychain.get(StorageManagerKey.username.rawValue) else {
        return nil
      }
      return Profile(username: username)
    } catch {
      print(error as Any)
    }
    return nil
  }

  func removeUsername() {
    do {
      try keychain.remove(StorageManagerKey.username.rawValue)
    } catch {
      print(error as Any)
    }
  }
}

private extension StorageManagerImp {

  enum StorageManagerKey: String {
    case notFirstLaunch
    case token
    case userId
    case username
  }

  struct Constants {
    static let serviceId = "StorageManagerKeychain.Service.Id"
  }

  func notFirstLaunch() -> Bool {
    UserDefaults.standard.bool(forKey: StorageManagerKey.notFirstLaunch.rawValue)
  }

  func saveFirstLaunch() {
    UserDefaults.standard.set(true, forKey: StorageManagerKey.notFirstLaunch.rawValue)
  }
}
