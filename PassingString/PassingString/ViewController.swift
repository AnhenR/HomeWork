//
//  ViewController.swift
//  PassingString
//
//  Created by user on 3.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    var laughString = "HaHaHa" 
    
    @IBOutlet weak var firstButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstButton.layer.cornerRadius = 20
        firstButton.setTitle("Weather forecast", for: .normal)
    }
    
    @IBAction func firstButtonAction(_ sender: Any) {
        navigation()
    }
    
    private func navigation(){
        let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        viewController.modalPresentationStyle = .fullScreen
        viewController.setString(newString: laughString)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

