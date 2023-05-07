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
  func saveToken(token: TokenResponse?)
  func getToken() -> TokenResponse?
  func removeToken()

  func saveUsername(username: Profile?)
  func getUsername() -> String?
  func removeUsername()

  func saveDate()
  func getDate() -> String?
}

class StorageManagerImp: StorageManager {

  private let keychain = Keychain(service: Constants.serviceId)

  func cleanKeychainIfNeeded() {
    guard !notFirstLaunch() else {
      return
    }
    saveFirstLaunch()

    do {
      try keychain.removeAll()
    } catch {
      print(error as Any)
    }
  }

  // MARK: - Token

  func saveToken(token: TokenResponse?) {
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

  func getToken() -> TokenResponse? {
    do {
      guard let token = try keychain.get(StorageManagerKey.token.rawValue),
            let userId = try keychain.get(StorageManagerKey.userId.rawValue) else {
        return nil
      }
      return TokenResponse(token: token, userId: userId)
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
  // MARK: - Username

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

  func getUsername() -> String? {
    do {
      guard let username = try keychain.get(StorageManagerKey.username.rawValue) else {
        return nil
      }
      return username
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

  // MARK: - Date in userdefaults

  func saveDate() {
    let format = DateFormatter()
    format.dateFormat = "dd.MM.yyyy"
    UserDefaults.standard.set(format.string(from: Date()), forKey: StorageManagerKey.dateOfEntrance.rawValue)
  }

  func getDate() -> String? {
    return UserDefaults.standard.string(forKey: StorageManagerKey.dateOfEntrance.rawValue) ?? ".. .. ...."
  }
}

// MARK: - Extensions

private extension StorageManagerImp {

  enum StorageManagerKey: String {
    case notFirstLaunch
    case token
    case userId
    case username
    case dateOfEntrance
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
