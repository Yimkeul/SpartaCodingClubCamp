//
//  Essential_1.swift
//  LSJSwiftMaster
//
//  Created by yimkeul on 3/17/25.
//

import Foundation

func Essential_1() {
    // 두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저
    let sum: (Int,Int) -> String = { a, b in
        return "두 수의 합은 \(a + b)입니다"
    }

    // 파라미터를 클로서로 받는 함수
    func calculate(sumClousre: (Int,Int) -> String) -> Void {
        print(sum(3,4))
    }
    
    print(sum(1, 2))
    calculate(sumClousre: sum)
}
