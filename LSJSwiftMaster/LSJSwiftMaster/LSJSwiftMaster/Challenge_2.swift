//
//  Challenge_2.swift
//  LSJSwiftMaster
//
//  Created by yimkeul on 3/17/25.
//

import Foundation

// PEngine 프로토콜: 자동차 엔진에 대한 공통 인터페이스 정의
protocol PEngine {
    var Ptype: String { get }
    func Pstart()
}

// PElectricEngine: Electric 엔진에 대한 구체적인 구현
class PElectricEngine: PEngine {
    var Ptype: String = "Electric"
    
    func Pstart() {
        print("전기 엔진 시작...")
    }
}

// PHydrogenEngine: Hydrogen 엔진에 대한 구체적인 구현
class PHydrogenEngine: PEngine {
    var Ptype: String = "Hydrogen"
    
    func Pstart() {
        print("수소 엔진 시작...")
    }
}

// PCar 프로토콜: 자동차에 대한 공통 인터페이스 정의
protocol PCar {
    var Pbrand: String { get }
    var Pmodel: String { get }
    var Pengine: PEngine { get }
    
    func Pdrive()
    func Pstop()
}

// PBasicCar: 기본적인 자동차 구현
class PBasicCar: PCar {
    var Pbrand: String
    var Pmodel: String
    var Pengine: PEngine
    
    init(Pbrand: String, Pmodel: String, Pengine: PEngine) {
        self.Pbrand = Pbrand
        self.Pmodel = Pmodel
        self.Pengine = Pengine
    }
    
    func Pdrive() {
        print("\(Pbrand) \(Pmodel) 주행 중...")
        Pengine.Pstart()  // 엔진 시작
    }
    
    func Pstop() {
        print("\(Pbrand) \(Pmodel) 정지 중...")
    }
}

/*
 장점:
 1. 다중 채택이 가능하여 유연성이 높음.
 2. 특정 기능을 명확하게 분리하여 코드의 응집도를 높일 수 있음.
 3. 기존 클래스의 변경 없이도 새로운 기능을 추가할 수 있어 개방-폐쇄 원칙(OCP)을 준수하기 쉬움.
 4. 프로토콜을 활용한 의존성 주입(Dependency Injection)이 가능하여 테스트가 용이함.

 단점:
 1. 기본 구현이 없으면 각 채택 클래스에서 동일한 코드가 반복될 가능성이 있음.
 2. 프로토콜 확장(Protocol Extension)을 사용하더라도, 상속처럼 저장 프로퍼티를 추가할 수 없음.
 3. 다형성을 활용하려면 AnyObject 또는 associatedtype을 사용해야 하는 경우가 있음.
*/
