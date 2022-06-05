//
//  ViewController.swift
//  PassingClassProperties
//
//  Created by user on 5.06.22.
//

import UIKit

class ViewController: UIViewController {
lazy var lableForNames = makeLable()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lableForNames.text = "Name variations \(Names().firstName) or \(Names().secondName), or \(Names().thirdName)"
        view.addSubview(lableForNames)
        NSLayoutConstraint.activate([
            lableForNames.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),
            lableForNames.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lableForNames.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            lableForNames.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    private func makeLable() -> UILabel {
        let mylable = UILabel()
        mylable.translatesAutoresizingMaskIntoConstraints = false
        return mylable
}
}

