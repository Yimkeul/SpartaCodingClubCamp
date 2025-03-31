//
//  Essential_2.swift
//  LSJSwiftMaster
//
//  Created by yimkeul on 3/17/25.
//

import Foundation

func Essential_2() {
    let numbers = [1, 2, 3, 4, 5]
    let sampleInputForQ2: [Int] = [1,2,3,4,5,6,7,8,9,10]
    var result = [String]()

    // ForEach -> Map
    func Q1() {
        result = numbers.map { String($0) }
        print(result)
    }
    
    // 고차함수로 체이닝
    func Q2(for input: [Int]) {
        let result = input.filter { $0 % 2 == 0 }.map { String($0) }
        print("\(result) - 타입 : \(type(of: result))")
    }
    
    // 고차함수 직접 구현
    func Q3() {
        
        func myMap(_ array: [Int], _ changer: (Int) -> String) -> [String] {
            return array.map { changer($0) }
        }
        let result = myMap([1, 2, 3, 4, 5]) {
            String($0)
        }
        print(result)
    }
    
    Q1()
    Q2(for: sampleInputForQ2)
    Q3()
    
}
