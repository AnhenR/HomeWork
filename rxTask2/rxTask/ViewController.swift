//
//  ViewController.swift
//  rxTask
//
//  Created by user on 11.09.22.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var firstSubscriber: UILabel!
    
    @IBOutlet weak var secondSubscriber: UILabel!
    
    let bag = DisposeBag()
    
    var names = BehaviorRelay(value: ["Ann"])
    
    let publishSubject = PublishSubject<Int>()
    
    let replaySubject = ReplaySubject<Int>.create(bufferSize: 3)
    
    let behaviorSubject = BehaviorSubject<Int>(value: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = names.debug().filter({ value in
            value.count > 3
        }).map({ value in
            value.joined(separator: ", ")
        }).subscribe(onNext: { [weak self] value in
            print(value)
            self?.firstSubscriber.text = value
        }).disposed(by: bag)
        
        names.accept(["Mari", "Bob", "Max", "Ann"])
        names.accept(["NNNNNNNN"])
        names.accept(["Mari", "Bob", "Max"])
        
        _ = names.subscribe { [weak self] value in
            self?.secondSubscriber.text = value.joined(separator: ", ")
        }.disposed(by: bag)
        
        names.accept(["Vova", "Liza"])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {[weak self] in
            
            self?.publishSubject.onNext(5)
            
            _ = self?.publishSubject.map{$0 * 10}.subscribe({ [weak self] value in
                self?.firstSubscriber.text = "\(value)"
            }).disposed(by: self!.bag)
            
            self?.publishSubject.onNext(4)
            
            _ = self?.publishSubject.map{$0 * 20}.filter{$0 > 10}.subscribe({ [weak self] value in
                self?.secondSubscriber.text = "\(value)"
            }).disposed(by: self!.bag)
            
            self?.publishSubject.onNext(2)
        })
        
        
        replaySubject.onNext(5)
        
        _ = replaySubject.map{$0 * 2}.subscribe({ value in
            print("First replay subscriber: \(value)")
        }).disposed(by: bag)
        
        replaySubject.onNext(4)
        
        _ = replaySubject.filter{$0 > 3}.subscribe({ value in
            print("Second replay subscriber: \(value)")
        }).disposed(by: bag)
        
        replaySubject.onNext(1)
        
        
        behaviorSubject.onNext(500)
        
        _ = behaviorSubject.subscribe({ value in
            print("First behavior subscriber: \(value)")
        }).disposed(by: bag)
        
        behaviorSubject.onNext(400)
        behaviorSubject.onNext(300)
        
        _ = behaviorSubject.subscribe({ value in
            print("Second behavior subscriber: \(value)")
        }).disposed(by: bag)
        
        behaviorSubject.onNext(100)
    }
}

