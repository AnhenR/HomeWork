//
//  ViewController.swift
//  PassingClassProperties
//
//  Created by user on 5.06.22.
//

import UIKit

class ViewController: UIViewController {
    var myName = Names()
    var myNames = Names2(name1: "Niko", name2: "Den", name3: "Pop")
    @IBOutlet weak var tapButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        tapButton.layer.cornerRadius = 20
    }
    
    @IBAction func tapButtonAction(_ sender: Any) {
        navigation()
    }
    private func navigation(){
        let storyboard = UIStoryboard(name: "ScreenToShowStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ScreenToShowViewController") as! ScreenToShowViewController
        viewController.modalPresentationStyle = .fullScreen
        viewController.setName1 = myName.firstName
        viewController.setName2 = myName.secondName
        viewController.setName3 = myName.thirdName
        viewController.setNames = myNames
        present(viewController, animated: true)
    }
}

