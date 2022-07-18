//
//  MyAlert.swift
//  Xib
//
//  Created by user on 18.07.22.
//

import Foundation
import UIKit

class MyAlert: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var myButton: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    @IBAction func tapButtonAction(_ sender: Any) {
    
    }
    
    func setup() {
        Bundle.main.loadNibNamed("MyAlert", owner: self, options: nil)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentView)
        contentView.frame = self.bounds
        myButton.layer.cornerRadius = 20
        myButton.setTitle("Tap", for: .normal)
    }
}
