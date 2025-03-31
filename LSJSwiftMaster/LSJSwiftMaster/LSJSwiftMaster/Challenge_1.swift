//
//  Challenge_1.swift
//  LSJSwiftMaster
//
//  Created by yimkeul on 3/17/25.
//

import Foundation

class Engine {
    var type: String
    init(type: String) {
        self.type = type
    }
}

class Car {
    var brand: String
    var model: String
    var year: String
    var engine: Engine
    
    init(brand: String, model: String, year: String, engine: Engine) {
          self.brand = brand
          self.model = model
          self.year = year
          self.engine = engine
      }
    // 운전하기 동작
    func drive() {
        print("\(brand) \(model) 주행 중...")
    }
    
    // 정지하기
    func stop() {
        print("\(brand) \(model) 정지 중...")
    }
    
    // 충전하기 (전기차 전용)
    func charge() {
        print("\(brand) \(model) 충전 중...")
    }
    
    // 연료 보충하기 (내연차 및 하이브리드차 전용)
    func refuel() {
        print("\(brand) \(model) 연료 보충 중...")
    }
}


// ElectricEngine 타입 정의
class ElectricEngine: Engine {
    init() {
        super.init(type: "Electric")
    }
}

// ElectricCar 클래스 설계 (Car 상속)
class ElectricCar: Car {
    init(brand: String, model: String, year: String) {
        let electricEngine = ElectricEngine()
        super.init(brand: brand, model: model, year: year, engine: electricEngine)
    }
    
    // 충전 동작을 더 강조하는 오버라이드
    override func charge() {
        print("\(brand) \(model) 전기차 충전 중...")
    }
}

// HydrogenEngine 타입 정의
class HydrogenEngine: Engine {
    init() {
        super.init(type: "Hydrogen")
    }
}

// HybridCar 클래스 설계 (Car 상속)
class HybridCar: Car {
    private var hydrogenEngine: HydrogenEngine
    
    init(brand: String, model: String, year: String) {
        let engine = Engine(type: "Gasoline")
        self.hydrogenEngine = HydrogenEngine()
        super.init(brand: brand, model: model, year: year, engine: engine)
    }
    
    // 엔진 교체 동작
    func switchEngine(to newEngine: Engine) {
        self.engine = newEngine
        print("엔진 교체 완료: \(newEngine.type) 엔진으로 변경되었습니다.")
    }
    
    // 하이브리드차 전용 동작
    override func refuel() {
        print("\(brand) \(model) 하이브리드차 연료 보충 중...")
    }
}


/*
 장점:
 1. 상위 클래스의 구현을 재사용할 수 있어 코드 중복이 줄어듦.
 2. 공통 기능을 가진 객체들을 계층적으로 관리할 수 있음.
 3. 다형성(Polymorphism)으로 인해 부모 타입으로 객체를 다룰 수 있음.

 단점:
 1. 단일 상속(Single Inheritance)만 가능하여 확장성이 떨어질 수 있음.
 2. 깊은 상속 구조는 코드의 복잡성을 증가시키고 유지보수가 어려워질 수 있음.
 3. 상속을 위해 부모 클래스에 불필요한 코드가 포함될 가능성이 있음.
 4. 상위 클래스에 의존성이 생겨 유연성이 떨어짐.
*/
