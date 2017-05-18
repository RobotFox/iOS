//
//  Calculator.swift
//  iCalc
//
//  Created by Ospite on 02/05/17.
//  Copyright © 2017 Ospite. All rights reserved.
//

import Foundation

class Calculator{
    
    var numberDisplay:Double
    var numberOperation:Double
    
    
    enum Operation {
        case add
        case subtract
        case divide
        case multiply
        case noOperation
    }
    var currentOperation:Operation
    
    
    
    init() {
        numberDisplay=0.0
        numberOperation=0.0
        currentOperation = Operation.noOperation
    }
    
    func add(a:Double, b:Double) -> Double {
        currentOperation = Operation.add
        var result = a+b
        return result
    }
    func sub(a:Double, b:Double) -> Double {
        currentOperation = Operation.subtract
        var result = a-b
        return result
    }
    func molt(a:Double, b:Double) -> Double {
        currentOperation = Operation.multiply
        var result = a*b
        return result
    }
    func div(a:Double,b:Double) -> Double {
        currentOperation = Operation.divide
        var result = a/b
        return result
    }
    func equal(number:Double) -> Void {
        numberOperation = number
    }
}
