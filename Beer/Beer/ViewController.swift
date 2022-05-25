//
//  ViewController.swift
//  Beer
//
//  Created by user on 20.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    /**
     для всех выводит
     */
    @IBOutlet weak private var lableForPrice: UILabel!
    
    /**
     без уточнения сорта для Ipa
     */
    @IBOutlet weak private var buttonForSum: UIButton!
    
    @IBOutlet weak private var volum: UILabel!
    
    @IBOutlet weak private var buttonForSumLager: UIButton!
    
    @IBOutlet weak private var volumeLager: UILabel!
    
    @IBOutlet weak private var buttonForSumStout: UIButton!
    
    @IBOutlet weak private var volumeStout: UILabel!
    
    @IBOutlet weak private var newShift: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonForSum.layer.cornerRadius = 10
        buttonForSum.layer.borderWidth = 9
        buttonForSumLager.layer.cornerRadius = 10
        buttonForSumLager.layer.borderWidth = 9
        buttonForSumStout.layer.cornerRadius = 10
        buttonForSumStout.layer.borderWidth = 9
        newShift.layer.borderWidth = 9
        newShift.layer.cornerRadius = 10
       
    }
    
    @IBAction private func buttonAction(_ sender: Any) {
        calculate("Ipa", volumeLabel: volum)
    }
    
    @IBAction private func buttonActionLager(_ sender: Any) {
        calculate("Lager", volumeLabel: volumeLager)
    }

    @IBAction private func buttonActionStout(_ sender: Any) {
        calculate("Stout", volumeLabel: volumeStout)
    }
    
    private func calculate(_ name: String, volumeLabel: UILabel) {
        BeerSaleManager.sale.updateProceedsAmount(name)
        lableForPrice.text = "\(BeerSaleManager.sale.getProceedsAmount())p"
        BeerSaleManager.sale.updateBeerVolume(name)
        volumeLabel.text = "\(BeerSaleManager.sale.getVolume(name))л"
    }
    
    @IBAction private func buttonNewShift(_ sender: Any) {
        lableForPrice.text = "\(BeerSaleManager.sale.zeroProceedsAmount())"
    }
}
