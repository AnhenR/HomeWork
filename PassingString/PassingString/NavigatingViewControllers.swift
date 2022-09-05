//
//  NavigatingViewControllers.swift
//  PassingString
//
//  Created by user on 5.06.22.
//

import Foundation
import UIKit

class Weather {
    static let weather = Weather()
    init(){}
    func weatherOptions() -> String {
        let options: [String] = ["cold", "rainy", "cloudy", "sunny", "windy"]
        guard let randomOption = options.randomElement() else { return "No" }
        return randomOption
    }
}

