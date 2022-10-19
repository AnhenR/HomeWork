//
//  PlacesViewController.swift
//  Belarus
//
//  Created by user on 13.10.22.
//

import Foundation
import UIKit

class PlacesViewController: UIViewController {
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cornflowers2")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Некалькі выдатных мясцін Беларусі, якія варта наведаць!"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.addShadow()
        return label
    }()
    
    private var placesTableView = UITableView()
    
    private var placesArray = ["Замкі","Прырода","Царквы"] {
        didSet {
            placesTableView.reloadData()
        }
    }
    
    private var churchArray = ["царква ў Сар'і", "касцёл у Гервятах", "храм у Чачэрску"]
    private var castleArray = ["Нясвіжскі замак", "замак у Марачоўшчыне", "Мірскі замак", "Лідскі замак"]
    private var natureArray = ["тэрыконы", "крэйдавыя кар'еры", "возера Белае і Нарач"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTable()
    }
    
    private func configureUI() {
        navigationItem.backButtonTitle = "Выйсці"
        view.addSubview(mainImage)
        mainImage.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: mainImage.topAnchor, constant: 100),
            descriptionLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: -10),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureTable() {
        view.addSubview(placesTableView)
        view.bringSubviewToFront(placesTableView)
        placesTableView.translatesAutoresizingMaskIntoConstraints = false
        placesTableView.layer.cornerRadius = 10
        placesTableView.alpha = 0.9
        placesTableView.backgroundColor = .gray
        NSLayoutConstraint.activate([
            placesTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            placesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            placesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            placesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        placesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlacesCell")
        placesTableView.dataSource = self
        placesTableView.delegate = self
    }
}

extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        placesArray.count
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        placesArray[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ReviewViewController(), animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return castleArray.count
        case 1:
            return natureArray.count
        case 2:
            return churchArray.count
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell", for: indexPath as IndexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel!.text = "\(castleArray[indexPath.row])"
        case 1:
            cell.textLabel!.text = "\(natureArray[indexPath.row])"
        case 2:
            cell.textLabel!.text = "\(churchArray[indexPath.row])"
        default:
            cell.textLabel!.text = "Пакуль месцаў няма"
        }
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .darkGray
        cell.alpha = 0.9
        return cell
    }
}



//private var placesButton: [UIButton] = [UIButton(), UIButton(), UIButton()]
//private func configureButton() {
//    placesButton.enumerated().forEach{ index, button in
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .darkGray
//        button.layer.cornerRadius = 30
//        button.alpha = 0.9
//        button.addShadow()
//        view.addSubview(button)
//        view.bringSubviewToFront(button)
//        placesButton[0].setTitle("Замкі", for: .normal)
//        placesButton[0].addTarget(self, action: #selector(didTapCastle), for: .touchUpInside)
//        placesButton[1].setTitle("Прырода", for: .normal)
//        placesButton[1].addTarget(self, action: #selector(didTapNature), for: .touchUpInside)
//        placesButton[2].setTitle("Царквы", for: .normal)
//        placesButton[2].addTarget(self, action: #selector(didTapChurch), for: .touchUpInside)
//
//        placesButton[index].topAnchor.constraint(equalTo: index == 0 ? descriptionLabel.bottomAnchor : placesButton[index - 1].bottomAnchor, constant: 20).isActive = true
//        placesButton[index].leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
//        placesButton[index].trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true
//        placesButton[index].heightAnchor.constraint(equalToConstant: 60).isActive = true
//    }
//}
//@objc private func didTapCastle() {
//    navigationController?.pushViewController(ReviewViewController(), animated: true)
//}
//
//@objc private func didTapNature() {
//    navigationController?.pushViewController(ReviewViewController(), animated: true)
//}
//
//@objc private func didTapChurch() {
//    navigationController?.pushViewController(ReviewViewController(), animated: true)
//}
