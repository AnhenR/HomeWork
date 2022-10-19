//
//  ViewController.swift
//  Belarus
//
//  Created by user on 13.10.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Некалькі выдатных мясцін Беларусі, якія варта наведаць!"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.addShadow()
        return label
    }()
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cornflowers")
        image.contentMode = .scaleToFill
        image.alpha = 0.9
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let cityButton: UIButton = {
        let button = UIButton()
        button.setTitle("Азнаёміцца", for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.alpha = 0.9
        button.addShadow()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        navigationItem.backButtonTitle = "Выйсці"
        view.addSubview(mainImage)
        view.addSubview(mainLabel)
        view.addSubview(cityButton)
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: mainImage.topAnchor, constant: 70),
            mainLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 10),
            mainLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: -10),
            mainLabel.heightAnchor.constraint(equalToConstant: 50),
            
            cityButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            cityButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            cityButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            cityButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        cityButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        view.bringSubviewToFront(cityButton)
        view.bringSubviewToFront(mainLabel)
    }
    
    @objc func didTap() {
        navigationController?.pushViewController(PlacesViewController(), animated: true)
    }
}

