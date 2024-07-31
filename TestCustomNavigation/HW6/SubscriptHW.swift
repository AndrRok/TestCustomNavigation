//
//  SubscriptHW.swift
//  TestCustomNavigation
//
//  Created by ARMBP on 7/31/24.
//

import Foundation

struct Cargo {
    var width: Double
    var height: Double
    var depth: Double
    
    var volume: Double {
        return width * height * depth
    }
}

infix operator +++: AdditionPrecedence

func +++ (lhs: Cargo, rhs: Cargo) -> Cargo {
    return Cargo(width: lhs.width + rhs.width,
                 height: lhs.height + rhs.height,
                 depth: lhs.depth + rhs.depth)
}

extension Array where Element == Cargo {
    subscript(c index: Index) -> Cargo {
        get {
            return self[index]
        }
        set(newValue) {
            self[index] = newValue
        }
    }
}

func cargoFunc() {
    let cargo1 = Cargo(width: 2.0, height: 3.0, depth: 4.0)
    let cargo2 = Cargo(width: 1.0, height: 1.5, depth: 2.0)
    
    let combinedCargo = cargo1 +++ cargo2
    print("Combined Cargo Volume: \(combinedCargo.volume) m^3")
    
    var cargos: [Cargo] = [cargo1, cargo2]
    cargos[c: 0] = combinedCargo
    print("Updated Cargo Volume: \(cargos[c: 0].volume) m^3")
}

