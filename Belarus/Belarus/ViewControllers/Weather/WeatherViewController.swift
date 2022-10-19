//
//  WeatherViewController.swift
//  Belarus
//
//  Created by user on 13.10.22.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cornflowers4")
        image.contentMode = .scaleToFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(mainImage)
        view.translatesAutoresizingMaskIntoSubviews()
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
