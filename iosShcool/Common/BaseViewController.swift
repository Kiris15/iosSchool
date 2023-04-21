//
//  BaseViewController.swift
//  iosSchool
//
//  Created by Savely on 31.03.2023.
//

import Foundation

import UIKit

protocol CoreViewController: AnyObject {
    associatedtype View

    var rootView: View { get }
}

class BaseViewController<View: UIView>: UIViewController, CoreViewController {

    var rootView: View = {
        let nibName = String(describing: View.self)
        let bundle = Bundle(for: View.self)

        if bundle.path(forResource: nibName, ofType: "nib") == nil {
            return View(frame: UIScreen.main.bounds)
        } else {
            let nib = UINib(nibName: nibName, bundle: bundle)

            if let view = nib.instantiate(withOwner: nil, options: nil).first as? View {
                return view
            } else {
                fatalError("Not load view \(nibName) from nib")
            }
        }
    }()

    override func loadView() {
        view = rootView
    }

  func showAlert(message: String) {
    let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
      alert.dismiss(animated: true)
    }))
    DispatchQueue.main.async {
      self.present(alert, animated: true)
    }
  }
}
