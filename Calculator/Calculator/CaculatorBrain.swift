//
//  CaculatorBrain.swift
//  Calculator
//
//  Created by Liu's MBA on 4/13/16.
//  Copyright © 2016 dancite. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    private enum Op {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    
    private var opStack = [Op]()
    
    private var knownOps = [String:Op]()
    
    init() {
        knownOps["×"] = Op.BinaryOperation("×", *)
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["−"] = Op.BinaryOperation("−") { $1 - $0}
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]){
        if !ops.isEmpty{
            var remainingOps = ops
            let op = remainingOps.removeLast()
                        
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        return nil
    }
    
    func pushOperand(valueOfOperand: Double)  {
        opStack.append(Op.Operand(valueOfOperand))
    }
    
    func performOperation(symbol: String) {
        if let operation = knownOps[symbol]{
            opStack.append(operation)
        }
        
    }
    
}