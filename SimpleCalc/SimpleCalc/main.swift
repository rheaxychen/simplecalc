//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    let operators = ["+", "-", "*", "/", "%"]
    
    public func calculate(_ args: [String]) -> Int {
        if args.count == 3 && operators.contains(args[1]) {
            return tradExp(args) // traditional expressions
        } else {
            return lessTradExp(args) // less-traditional expressions
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    // + - * / %
    private func tradExp(_ args: [String]) -> Int {
        let opt = args[1]
        let left : Int? = Int(args[0]) // nil, Optional, Type Annotations
        let right : Int? = Int(args[2])
        switch opt {
        case "+" : return left! + right!
        case "-" : return left! - right!
        case "*" : return left! * right!
        case "/" : return left! / right!
        case "%" : return left! % right!
        default: return -1
        }
    }
    
    // count avg fact
    private func lessTradExp(_ args: [String]) -> Int {
        var res = 0
        if args.count == 1 { // no argument
            return res
        }
        let last = args[args.count - 1]
        switch last {
        case "count" : return (args.count - 1)
        case "avg" :
            for index in args {
                let num : Int = Int(index) ?? 0 // Resources cited below
                res += num // Compound Assignment Operators
            }
            res /= (args.count - 1)
            return res
        case "fact" :
            var curr: Int = Int(args[0]) ?? 0
            if curr == 0 || curr == 1 {
                res = 1
            } else {
                res = curr
                curr -= 1
                while curr > 1 {
                    res *= curr
                    curr -= 1
                }
            }
            return res
        default : return -1
        }
    }
}

// Starter Code
print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

// "nil coalescing operator" or "default operator"
// https://stackoverflow.com/questions/30772063/operator-in-swift
