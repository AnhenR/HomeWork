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
        dateLabel.text = "\(L10n.date): \(time)"
        tempLabel.text = "\(L10n.maxTemp) : \(tempMax)"
        minTempLabel.text = "\(L10n.minTemp) : \(tempMin)"
    }
}
