//
//  ViewController.swift
//  HomeWork
//
//  Created by user on 6.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    var a: Double = 2.5
    var b: Double = 9.7
    var c: Double = 6.9
    var e: Double = 8.2
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var a1: Double = Double(Int(a))
        var a2: Double = a - Double(Int(a))
        
        var b1: Double = Double(Int(b))
        var b2: Double = b - Double(Int(b))
        
        var c1: Double = Double(Int(c))
        var c2: Double = c - Double(Int(c))
        
        var e1: Double = Double(Int(e))
        var e2: Double = e - Double(Int(e))
        
        var s = a1 + b1
        print(s)
        if s.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var d = a1 + c1
        print(d)
        if d.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var f = a1 + e1
        print(f)
        if f.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var g = b1 + c1
        print(g)
        if g.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var h = b1 + e1
        print(h)
        if h.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var j = c1 + e1
        print(j)
        if j.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var k = a1 + c1
        print(k)
        if k.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var r = a2 + b2
        print(r)
        if r.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var t = a2 + c2
        print(t)
        if t.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var y = a2 + e2
        print(y)
        if y.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var u = b2 + c2
        print(u)
        if u.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var i = b2 + e2
        print(i)
        if i.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var o = c2 + e2
        print(o)
        if o.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        var p = a2 + c2
        print(p)
        if p.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
        }
        print("Но мне кажется, что это можно сделать короче")
        
        print("Еще вариант с разделением дробного числа")
        
        var nam = 2.5
        var nan = 9.7
        var cel = floor(nam)
        var dr = nam.truncatingRemainder(dividingBy: 1)
        var cel1 = floor(nan)
        var dr1 = nan.truncatingRemainder(dividingBy: 1)
        var w = cel + cel1
        var ww = dr + dr1
        print(w)
        print(ww)
        
        if w.truncatingRemainder(dividingBy: 2) == 0 {
            print("even")
        }
        else {
            print("odd")
            
            if ww.truncatingRemainder(dividingBy: 2) == 0 {
                print("even")
            }
            else {
                print("odd")
                
            }
            
        }
    }
}


