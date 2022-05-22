//
//  ViewController.swift
//  Beer
//
//  Created by user on 20.05.22.
//

import UIKit

class ViewController: UIViewController {

 
    
    
    @IBOutlet weak var lableForPrice: UILabel!
    
   
  
    @IBOutlet weak var buttonForSum: UIButton!
    
    @IBOutlet weak var volum: UILabel!

    
   
    
    @IBOutlet weak var buttonForSumLager: UIButton!
    
    @IBOutlet weak var volumeLager: UILabel!
    
    
    
    @IBOutlet weak var buttonForSumStout: UIButton!
    
    @IBOutlet weak var volumeStout: UILabel!
    
    
    
    
    @IBOutlet weak var newShift: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        
    }
    
   
    @IBAction func buttonAction(_ sender: Any) {
        SaleBeer.sale.PriceCalculationIpa()
        lableForPrice.text = "\(SaleBeer.sale.PriceReturnIpa())p"
        SaleBeer.sale.VolumeSubtractionIpa()
        volum.text = "\(SaleBeer.sale.VolumeReturnIpa())л"
        
    }
    
    
    @IBAction func buttonActionLager(_ sender: Any) {
        SaleBeer.sale.PriceCalculationLager()
        lableForPrice.text = "\(SaleBeer.sale.PriceReturnLager())p"
        SaleBeer.sale.VolumeSubtractionLager()
        volumeLager.text = "\(SaleBeer.sale.VolumeReturnLager())л"
    }
    
    
    
    
    @IBAction func buttonActionStout(_ sender: Any) {
        SaleBeer.sale.PriceCalculationStout()
        lableForPrice.text = "\(SaleBeer.sale.PriceReturnStout())p"
        SaleBeer.sale.VolumeSubtractionStout()
        volumeStout.text = "\(SaleBeer.sale.VolumeReturnStout())л"
    }
    
    
    
    
    
    
    
    
    @IBAction func buttonNewShift(_ sender: Any) {
        lableForPrice.text = "\(SaleBeer.sale.StartSum())"
        SaleBeer.sale.StartSum()
        
    }
    
    
    
    
}
    


