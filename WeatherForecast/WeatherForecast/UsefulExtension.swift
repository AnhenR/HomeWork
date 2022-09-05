//
//  UsefulExtension.swift
//  WeatherForecast
//
//  Created by user on 14.08.22.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }
}

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(_ args: CVarArg...) -> String {
        return String(format: localized, args)
    }
}

enum L10n {
    static let firstCity = "firstCity".localized
    static let secondCity = "secondCity".localized
    static let thirdCity = "thirdCity".localized
    static let date = "date".localized
    static let maxTemp = "maxTemp".localized
    static let minTemp = "minTemp".localized
}
