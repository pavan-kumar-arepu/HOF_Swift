//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by Mohammad Azam on 2/8/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView! 
    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let justObjservable = Observable.just("Hello RxSwift")
        let arrayObservable = Observable.from([1,2,3])
        let dictionaryObservable = Observable.from([1:"Hello",2:"Rx"])
        
////        let dictSubscribe = dictionaryObservable.subscribe{event in
////            print(event)
    //}

        let arraySubscription = arrayObservable.subscribe{
        event in
        switch event {
        case .next (let value):
            print (value)
        case .error (let error):
            print (error)
        case .completed:
            print("completed")
            }
        }

        
        //OnNext production from Map
        Observable<Int>.of(1,2,3,4,5,6,7).map { value in
        return value * value
        }.subscribe(onNext:{
            print($0)
        })
        
        
        //Event Production from Map
        let arrayObs =  arrayObservable.map{ value in
             return value * value * value
                }

        _ = arrayObs.subscribe{event in
            print (event)
        }
        
        //OnNext production from filter
        Observable<Int>.of(1,2,3,4,5,6,7,8,24,30).filter{$0>8}.subscribe(onNext:{
                print($0)
        })
        
        
        print("Printing ```FlatMap``` example")
        //FlatMap
        let observable1  = Observable<Int>.of(1,2)
        let observable2  = Observable<Int>.of(3,4)
                let observableOfObservables = Observable.of(observable1,observable2)
//                observableOfObservables.subscribe(onNext:{
//                    print($0)
//                })
                observableOfObservables.flatMap{ return $0 }.subscribe(onNext:{
                    print($0)
                })
    }
}
