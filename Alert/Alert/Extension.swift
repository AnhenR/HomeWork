//
//  Extension.swift
//  Alert
//
//  Created by user on 8.07.22.
//

import Foundation

import UIKit

extension UIViewController {
    func alertTextField (titleController: String, massage: String, styleController: UIAlertController.Style, titleAction: String, styleAction: UIAlertAction.Style) {
        let alertController = UIAlertController(title: titleController, message: massage, preferredStyle: styleController)
        let action = UIAlertAction(title: titleAction, style: styleAction) { (action) in
            let text = alertController.textFields?.first
            print(text ?? "nil text")
        }
        alertController.addTextField { (textField) in
        }
        alertController.addAction(action)
        self.present(alertController,animated: true, completion: nil)
    }
    
    func alertButton (titleController: String, massage: String, styleController: UIAlertController.Style, titleAction: String, styleAction: UIAlertAction.Style) {
        let alertController = UIAlertController(title: titleController, message: massage, preferredStyle: styleController)
        let action = UIAlertAction(title: titleAction, style: styleAction) { (action) in
            print("ok")
        }
        alertController.addAction(action)
        self.present(alertController,animated: true, completion: nil)
    }
    
    func alertTwoButtons (titleController: String, massage: String, styleController: UIAlertController.Style, titleActionFirst: String, styleActionFirst: UIAlertAction.Style, titleActionSecond: String, styleActionSecond: UIAlertAction.Style) {
        let alertController = UIAlertController(title: titleController, message: massage, preferredStyle: styleController)
        let action = UIAlertAction(title: titleActionFirst, style: styleActionFirst) { (action) in
            print("ok")
        }
        let secondAction = UIAlertAction(title: titleActionSecond, style: styleActionSecond) { (secondAction) in
            print("okok")
        }
        alertController.addAction(action)
        alertController.addAction(secondAction)
        self.present(alertController,animated: true, completion: nil)
    }
}
