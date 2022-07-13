//
//  RecordTableViewController.swift
//  Race
//
//  Created by user on 6.06.22.
//

import Foundation
import UIKit

class RecordTableViewController: UIViewController {
    let namLable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        makeUI()
        
    }
    
    
    private func makeUI() {
        NSLayoutConstraint.activate([
            namLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            namLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            namLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            namLable.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func configureUi() {
        view.addSubview(namLable)
        namLable.translatesAutoresizingMaskIntoConstraints = false
        namLable.textColor = .black
        namLable.backgroundColor = .darkGray
        namLable.textAlignment = .center
        
    }
}
