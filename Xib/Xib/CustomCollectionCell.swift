//
//  CustomCollectionCell.swift
//  Xib
//
//  Created by user on 3.08.22.
//

import Foundation
import UIKit

class CustomCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    static var reuseIdentifier = String(describing: CustomCollectionCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    func makeImage(with image: UIImage) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
    }
}
