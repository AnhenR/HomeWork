//
//  ViewController.swift
//  Xib
//
//  Created by user on 18.07.22.
//

import UIKit
import SwiftyKeychainKit

class ViewController: UIViewController {
    
    @IBOutlet var contentView: MyAlert!
    
    private let minLength = 6
    private lazy var regex = "^(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{\(minLength),}$"
    private let password = "123Qw!"
    
    let keychain = Keychain(service: "com.arc.keychain")
    let accessTokenKey = KeychainKey<String>(key: "accessToken")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeStartUI()
        contentView.textField.delegate = self
        contentView.messageLabel.numberOfLines = 0
    }
    
    private func makeStartUI() {
        if let token = try? keychain.get(accessTokenKey) {
            contentView.messageLabel.text = "Passwordless login available"
            contentView.messageLabel.textColor = .green
        } else {
            contentView.messageLabel.text = "Enter password!"
            contentView.messageLabel.textColor = .red
        }
        contentView.myButton.addTarget(self, action: #selector(alert), for: .touchUpInside)
    }
    
    private func checkValidation(password: String) {
        guard password.count >= minLength else {
            contentView.messageLabel.text = ""
            return
        }
        
        if password.matches(regex) {
            contentView.messageLabel.textColor = .green
            contentView.messageLabel.text = "Valid characters in the password!"
        } else {
            contentView.messageLabel.textColor = .black
            contentView.messageLabel.text = "Minimum \(minLength) characters\nMust contain: \n1 capital letter,\n1 small letter,\n1 number, and\n1 special character"
        }
    }
    
    @objc private func alert() {
        if let token = try? keychain.get(accessTokenKey) {
            next()
        }
        else {
            //            Было
            //            let alertController = UIAlertController(title: "Перейти к картинкам", message: "сейчас", preferredStyle: .alert)
            //            let action = UIAlertAction(title: "Перейти", style: .default) { _ in
            //                guard let text = alertController.textFields else {return}
            //                text[0].text == "123" ? self.next() : print("no")
            //                do {
            //                    try self.keychain.set("wearstjydhgt", for: self.accessTokenKey)
            //                } catch {
            //                    print(error.localizedDescription)
            //                }
            //            }
            //            alertController.addTextField { (textField) in
            //                textField.placeholder = "Password"
            //            }
            //            alertController.addAction(action)
            //            present(alertController, animated: true)
            if contentView.textField.text == password {
                self.next()
                do {
                    try self.keychain.set("123", for: self.accessTokenKey)
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                contentView.messageLabel.text = "Wrong password entered"
                contentView.messageLabel.textColor = .red
            }
        }
    }
    
    private func next() {
        let storyboard = UIStoryboard(name: "ImageStoryboard", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ImageController") as? ImageController else {
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text ?? "") + string
        let res: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            res = String(text[text.startIndex..<end])
        } else {
            res = text
        }
        
        checkValidation(password: res)
        textField.text = res
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let isSuccess = (textField.text == password)
        contentView.messageLabel.textColor = isSuccess ? .green : .red
        contentView.messageLabel.text = isSuccess ? "Success" : "Error"
        textField.resignFirstResponder()
        return true
    }
}

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

