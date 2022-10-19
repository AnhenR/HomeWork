//
//  ViewExtension.swift
//  Belarus
//
//  Created by user on 16.10.22.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow(shadowColor: UIColor = .black,shadowOffset: CGSize = CGSize(width: 20, height: 10),shadowOpacity: Float = 0.6,shadowRadius: Double = 15 ) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
