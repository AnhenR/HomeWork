//
//  ReviewViewModel.swift
//  Belarus
//
//  Created by user on 19.10.22.
//

import Foundation
import UIKit

//тут будут массивы текстов и картинки
struct Review {
    var imagePlace: [UIImage]
    var descriptionPlace: String
}

class ReviewViewModel {
    let review: Review
    
    init(review: Review){
        self.review = review
    }
    
}
