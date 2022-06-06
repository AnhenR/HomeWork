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
    
    lazy var lableForNames = makeLable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lableForNames.text = "\(setName1), \(setName2) or \(setName3)"
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
