//
//  ScreenToShow.swift
//  PassingClassProperties
//
//  Created by user on 6.06.22.
//

import Foundation
import UIKit

class ScreenToShowViewController: UIViewController {
    var setName1 = ""
    var setName2 = ""
    var setName3 = ""
    var setNames = Names2(name1: "", name2: "", name3: "")
    
    lazy var lableForNames = makeLable()
    lazy var lableForNames2 = makeLable1()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lableForNames.text = "\(setName1), \(setName2) or \(setName3)"
        lableForNames2.text = setNames.name3
        view.addSubview(lableForNames2)
        view.addSubview(lableForNames)
        NSLayoutConstraint.activate([
            lableForNames.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),
            lableForNames.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lableForNames.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            lableForNames.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            lableForNames2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            lableForNames2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lableForNames2.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            lableForNames2.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    private func makeLable() -> UILabel {
        let mylable = UILabel()
        mylable.translatesAutoresizingMaskIntoConstraints = false
        return mylable
}
    private func makeLable1() -> UILabel {
        let mylable = UILabel()
        mylable.translatesAutoresizingMaskIntoConstraints = false
        return mylable
}
}
