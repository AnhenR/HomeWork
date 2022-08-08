//
//  CustomCell.swift
//  WeatherForecast
//
//  Created by user on 5.08.22.
//

import Foundation
import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    static var reuseIdentifier = String(describing: CustomCell.self)
    
    override func prepareForReuse() {
        dateLabel.text = nil
        tempLabel.text = nil
        minTempLabel.text = nil
    }
    
    func configure( time: String, tempMax: Float, tempMin: Float) {
        dateLabel.text = "Date: \(time)"
        tempLabel.text = "Max temp: \(tempMax)"
        minTempLabel.text = "Min temp: \(tempMin)"
    }
}
