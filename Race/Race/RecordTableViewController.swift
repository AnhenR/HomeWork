//
//  RecordTableViewController.swift
//  Race
//
//  Created by user on 6.06.22.
//

import Foundation
import UIKit

class RecordTableViewController: UIViewController {
    private let namLable = UILabel()
    private var myTable = UITableView()
    private var nameArray : [String] = ["Ann", "Bob","Liza"] {
        didSet {
            myTable.reloadData()
        }
    }
    private var resultArray : [Int] = [10, 5, 8] {
        didSet {
            myTable.reloadData()
        }
    }
    
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
            namLable.heightAnchor.constraint(equalToConstant: 40),
            
            myTable.topAnchor.constraint(equalTo: namLable.bottomAnchor, constant: 10),
            myTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            myTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            myTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    private func configureUi() {
        view.addSubview(namLable)
        namLable.translatesAutoresizingMaskIntoConstraints = false
        namLable.textColor = .black
        namLable.backgroundColor = .darkGray
        namLable.textAlignment = .center
        
        view.addSubview(myTable)
        myTable.translatesAutoresizingMaskIntoConstraints = false
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTable.dataSource = self
        myTable.delegate = self
        
    }
}

extension RecordTableViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
////        return nameArray.count
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel?.text = "\(L10n.tableName): \(nameArray[indexPath.row]), \(L10n.tableResult):  \(resultArray[indexPath.row])"
        return cell
    }
}
