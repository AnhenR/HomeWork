//
//  ViewController.swift
//  Xib
//
//  Created by user on 18.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var contentView: MyAlert!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertButton()
    }
    
    private func alertButton() {
        contentView.myButton.addTarget(self, action: #selector(alert), for: .touchUpInside)
    }
    
    @objc private func alert() {
        let alertController = UIAlertController(title: "Перейти к картинкам", message: "сейчас", preferredStyle: .alert)
        let action = UIAlertAction(title: "Перейти", style: .default) { _ in
            guard let text = alertController.textFields else {return}
            text[0].text == "123" ? self.next() : print("no")
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Password"
        }
        alertController.addAction(action)
        present(alertController, animated: true)
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

