//
//  SaleBeer.swift
//  Beer
//
//  Created by user on 20.05.22.
//

import Foundation


class SaleBeer {
    static let sale = SaleBeer()
    private var start: Double = 0
    
    private init(){ }
    
    var beerIPA = Beer(name: "Ipa", price: 3, country: "USA", volume: 30, jar: 0.3)

    
    
    func PriceCalculationIpa ()  {
        start += beerIPA.price
                }
    func PriceReturnIpa () -> Double {
        return start
    }
    
    func VolumeSubtractionIpa () {
        beerIPA.volume -= beerIPA.jar
    }
    
    func VolumeReturnIpa () -> Double {
        return beerIPA.volume
    }
    
    
    
    var beerLager = Beer(name: "Lager", price: 4, country: "USA", volume: 40, jar: 0.4)

    func PriceCalculationLager ()  {
        start += beerLager.price
                }
    func PriceReturnLager () -> Double {
        return start
    }

    func VolumeSubtractionLager () {
        beerLager.volume -= beerLager.jar
    }

    func VolumeReturnLager () -> Double {
        return beerLager.volume
    }


    var beerStout = Beer(name: "Stout", price: 5, country: "USA", volume: 50, jar: 0.5)

    func PriceCalculationStout ()  {
        start += beerStout.price
                }
    func PriceReturnStout () -> Double {
        return start
    }

    func VolumeSubtractionStout () {
        beerStout.volume -= beerStout.jar
    }

    func VolumeReturnStout () -> Double {
        return beerStout.volume
    }



    func StartSum () -> Double {
            start = 0
            return start
        }
//
//
//
    
    
}
