//
//  UsefulExtension.swift
//  Race
//
//  Created by user on 22.06.22.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow(shadowColor: UIColor = .gray,shadowOffset: CGSize = CGSize(width: 8, height: 8),shadowOpacity: Float = 0.5,shadowRadius: Double = 6 ) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.gray.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.type = .axial
        gradientLayer.cornerRadius = layer.cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach{ view in self.addSubview(view) }
    }
    
    func translatesAutoresizingMaskIntoSubviews() {
        subviews.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}

extension String {
    func wordCount() -> Int {
        let regex = try? NSRegularExpression(pattern: "\\w+")
        return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
    }
    
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
}
