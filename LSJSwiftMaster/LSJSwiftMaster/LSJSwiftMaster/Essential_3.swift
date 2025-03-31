//
//  Essential_3.swift
//  LSJSwiftMaster
//
//  Created by yimkeul on 3/17/25.
//

import Foundation

func Essential_3() {

    let testInput1: [Int] = [1, 2, 3, 4, 5]
    let testInput2: [String] = ["가", "나", "다", "라", "마"]

    // Int 배열 짝수번째 요소 제거
    func a(_ array: [Int]) -> [Int] {
        return array.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
    }
    
    // String 배열 짝수번째 요소 제거
    func b(_ array: [String]) -> [String] {
        return array.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
    }
    
    // 제네릭으로 타입을 선언하고 여러 타입에 적용이 가능하도록 설계
    func c<T>(_ array: [T]) -> [T] {
        return array.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
    }

    // 제네릭으로 Numeric으로 제한
    func d<T: Numeric>(_ array: [T]) -> [T] {
        return array.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
    }
    
    
    print(a(testInput1))
    print(b(testInput2))
    print(c(testInput1))
    print(c(testInput2))
    print(d(testInput1))
    

}
