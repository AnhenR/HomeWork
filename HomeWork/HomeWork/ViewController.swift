//
//  ViewController.swift
//  HomeWork
//
//  Created by user on 6.05.22.
//

import UIKit

class ViewController: UIViewController {
    func sum (a: Double, b: Double) {
        print(a + b)
    }
    func sum (a: Int, b: Int) {
        print(a + b)
        
    }
    
    func subtract (a: Double, b: Double) {
        print(a - b)
    }
    
    
    func subtract (a: Int, b: Int) {
        print(a - b)
    }
    
    func division (a: Double, b: Double) {
        print(a / b)
    }
    
    
    func division (a: Int, b: Int) {
        print(a / b)
    }
    
    func multiply (a: Double, b: Double) {
        print(a * b)
    }
    
    
    func multiply (a: Int, b: Int) {
        print(a * b)
    }
    
    
//    func hueta (var b: String = "123") {
//        var l = 0
//        for i in b {
//            var o = i.wholeNumberValue ?? 0
//            l = l + o
//        }
//        print(l)
//    }
    
    func hueta (var b: Int = 123) {
        var l = 0
        var d: String = String(b)
        for i in d {
            var o: Int = i.wholeNumberValue ?? 0
            l = l + o
            
        }
        print(l)
    }
    
    
    func comparison(text: String = "asd", text2: String = "asdf") {
        if text.count > text2.count {
            print("Первый текст как-то больше")
        }
        else if text.count < text2.count {
            print("Первый текст как-то меньше")
        }
        else if text.count == text2.count {
            print("Они как-то равны")
        }
        
    }
    
    func comp (text1: String = "", text2: String = "") {
        if text1 > text2 {
            print("больше")
        }
        if text2 > text1 {
            print("меньше")
        }
        if text1 == text2 {
            print("ghjkfkkfsfs")
        }
    }
    
    
    func degree (num: Double, power: Double = 2) {
        print(pow(num,power))
    }
    
    
    func hueta2 (var b: Int = 7) {
        var e = 1
        for i in 1...b {
            e = e * i
            
        }
        print(e)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sum(a: 2.5, b: 2.7)
        sum(a: 2, b: 4)
        subtract(a: 2.4, b: 2.6)
        subtract(a: 2, b: 2)
        division(a: 2.8, b: 2.1)
        division(a: 2, b: 2)
        multiply(a: 2.7, b: 2.9)
        multiply(a: 2, b: 2)
        hueta(var: 666)
        print("В первом варианте неправильно поняла задание")
        comparison(text: "adf", text2: "fhfттт")
        print("Исправила вроде")
        comp(text1: "эюя", text2: "абв")
        print("Есть много вопросов по этому типу сравнения")
        degree(num: 1)
        hueta2(var: 3)
        
        
        
        
        
    }
    
    
}


