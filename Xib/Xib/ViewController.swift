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
        let alert = UIAlertController(title: "Eror", message: "oh", preferredStyle: .alert)
        let action = UIAlertAction(title: "Hi", style: .default) { _ in
            print("Hi")
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

