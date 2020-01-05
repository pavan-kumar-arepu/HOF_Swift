import UIKit
import RxSwift
import PlaygroundSupport

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

strikes
.ignoreElements()
    .subscribe { _ in
        print("[Subscription is called]")
}.disposed(by: disposeBag)

strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

strikes.onCompleted()



//let justObservable = Observable.just("Hello RxSwift")
//let arrayObservable = Observable.from([1,2,3])
//let dictionaryObservable = Observable.from([1:"Hello",2:"Rx"])


let justObjservable = Observable.just("Hello RxSwift")

let arrayObservable = Observable.from([1,2,3])

let dictionaryObservable = Observable.from([1:"Hello",2:"Rx"])


//Model
struct Person {
    let name: String
    let address: String
    let age: Int
    let income: Double
    let cars: [String]
}

//Data
let peopleArray =
            [
             Person(name:"Santosh", address: "Pune, India", age:34, income: 100000.0, cars:["i20","Swift VXI"]),
             Person(name: "John", address:"New York, US", age: 23, income: 150000.0, cars:["Crita", "Swift VXI"]),
             Person(name:"Amit", address:"Nagpure, India", age:17, income: 200000.0, cars:Array())
            ]


//Traditional method of iterating loop
var name: [String] = Array()

for person in peopleArray {
    name.append(person.name)
}
print(name)

//Using High Order Funtion - Map : Approch 1

let names_map = peopleArray.map({(person) -> String in
    return person.name
})
print(names_map)

//Using High Order Funtion - Map : Approch 2

let names_map_shortcut = peopleArray.map({$0.name})
print (names_map_shortcut)

print("Fetching cars using 'Map' ")
let cars = peopleArray.map({$0.cars})
print(cars)

print("Fetching cars using 'FlatMap' ")
//Using High Order Function: FlatMap
let cars_flatmap = peopleArray.flatMap({$0.cars})
print(cars_flatmap)


print("Fetching cars using 'FlatMap' then again apply 'flatmap'")
//Using High Order Function: FlatMap
let cars_flatmap_flatmap = peopleArray.flatMap({$0.cars}).flatMap{$0}
print(cars_flatmap_flatmap)


//flatmap: Square the postive numbers from given array:

let numbers = [-2, -1, -23, -12,  12, 0, 1, 2]
let squares = numbers.flatMap { (num: Int) -> Int? in
  if num >= 0 {
    return num * num
    }
  return nil
}.reduce(0,+)
print(squares)

//Reduce:

let numbers = [23.23478, -2.32784, 34.328, 33.28347]
let sum = numbers.reduce(0)
{ (result, next) -> Double in
    return result + next
}
print("sum : \(sum)")


//Just single line...What a flexibility:-)
let sum_concise = numbers.reduce(0,+)
print("sum_concise : \(sum_concise)")
