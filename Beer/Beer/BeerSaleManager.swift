//
//  SaleBeer.swift
//  Beer
//
//  Created by user on 20.05.22.
//

import Foundation

class BeerSaleManager {
    static let sale = BeerSaleManager()
    private var proceedsAmount: Double = 0
    
    private init(){ }
    
    private var beer = [Beer(name: "Ipa", price: 3, country: "USA", volume: 1, jar: 0.3),
                        Beer(name: "Lager", price: 4, country: "USA", volume: 40, jar: 0.4),
                        Beer(name: "Stout", price: 5, country: "USA", volume: 50, jar: 0.5)]
    
    func updateProceedsAmount(_ name: String)  {
        if let beer = beer.first(where: { $0.name == name }) {
            if beer.volume - beer.jar >= 0 {
                proceedsAmount += beer.price
            }
        }
    }
    
    func updateBeerVolume(_ name: String) {
        if let beer =  beer.first(where: { $0.name == name }) {
            if beer.volume - beer.jar >= 0 {
                beer.volume -= beer.jar
            }
        }
    }
    
    func getVolume(_ name: String) -> Double {
        if let beer = beer.first(where: { $0.name == name }) {
            return round(beer.volume * 1000) / 1000
        }
        else {
            return 0
        }
    }
    
    func zeroProceedsAmount() -> Double {
        proceedsAmount = 0
        return proceedsAmount
    }
    
    func getProceedsAmount() -> Double {
        return proceedsAmount
    }
}
