//
//  ViewController.swift
//  TableColor
//
//  Created by user on 31.07.22.
//

import UIKit

class ViewController: UIViewController {
    private var colorTableView = UITableView()
    private var backgroundColorArray : [UIColor] = [.blue , .black, .cyan, .brown, .magenta, .gray] {
        didSet {
            colorTableView.reloadData()
        }
    }
    private let addColorButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        setupTableView()
    }
    
    private func makeUI() {
        view.addSubview(colorTableView)
        colorTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            colorTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            colorTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            colorTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        colorTableView.delegate = self
        colorTableView.dataSource = self
        colorTableView.backgroundColor = .clear
        
        view.addSubview(addColorButton)
        addColorButton.translatesAutoresizingMaskIntoConstraints = false
        addColorButton.setTitle("Add", for: .normal)
        addColorButton.backgroundColor = .darkGray
        addColorButton.addTarget(self, action: #selector (didTapAdd), for: .touchUpInside)
        NSLayoutConstraint.activate([
            addColorButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            addColorButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            addColorButton.heightAnchor.constraint(equalToConstant: 30),
            addColorButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func didTapAdd() {
        let secondBackgroundColor : [UIColor] = [.yellow, .black, .green, .darkGray,.red, .orange, .purple]
        backgroundColorArray.append(contentsOf: secondBackgroundColor)
    }
}

private extension ViewController {
    func setupTableView() {
        let customCell = UINib(nibName: "CustomCell", bundle: nil)
        colorTableView.register(customCell, forCellReuseIdentifier: "CustomCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backgroundColorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = colorTableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {return UITableViewCell() }
        cell.colorButton.layer.cornerRadius = 20
        cell.colorButton.tag = indexPath.row
        cell.backgroundColor = backgroundColorArray[indexPath.row]
        //        switch indexPath.row {
        //        case 0: cell.backgroundColor = .red
        //        case 1: cell.backgroundColor = .magenta
        //        case 2: cell.backgroundColor = .cyan
        //        case 3: cell.backgroundColor = .blue
        //        case 4: cell.backgroundColor = .brown
        //        default: cell.backgroundColor = .clear
        //        }
        cell.colorButton.addTarget(self, action: #selector (didTap(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func didTap( _ button: UIButton) {
        view.backgroundColor = backgroundColorArray[button.tag]
        //        switch button.tag {
        //        case 0: view.backgroundColor = .red
        //        case 1: view.backgroundColor = .magenta
        //        case 2: view.backgroundColor = .cyan
        //        case 3: view.backgroundColor = .blue
        //        case 4: view.backgroundColor = .brown
        //        default : view.backgroundColor = .gray
        //        }
    }
}

