//
//  FifthViewController.swift
//  PassingString
//
//  Created by user on 3.06.22.
//

import Foundation
import UIKit

class FifthViewController: UIViewController {
    lazy var lable = makeLable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lable.text = "\(ViewController().string1) \(Weather.weather.weatherOptions())"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(lable)
        NSLayoutConstraint.activate([
            lable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            lable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170),
            lable.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            lable.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 30)
        ])
    }
    private func makeLable() -> UILabel {
        let mylable = UILabel()
        mylable.translatesAutoresizingMaskIntoConstraints = false
        return mylable
    }
}
