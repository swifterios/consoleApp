//
//  main.swift
//  consoleApp
//
//  Created by Владислав on 24.07.2021.
//

import Foundation

var isShouldClose = false
var arguments: Array<Double> = [1, 2, 3]
var readedLine: String?
var isCorrectNum = false

while !isShouldClose {
    
    start()
    isWantToExit()
}

func start() {
    for (i, _) in arguments.enumerated() {
        enterValue(index: i)
    }
    
    print(calcDiscriminant(args: arguments))
}

func enterValue(index: Int) {
    var isCorrect = false
    print("Please, enter argument. If u want to use default value press enter")
    
    while !isCorrect {
        readedLine = readLine()
        
        if isEmpty(a: readedLine!) {
            print("Value is empty. Using default value \(arguments[index])")
            isCorrect = true
            return
        }
        
        if !isNumber(a: readedLine!) {
            print("Error. Please, enter correct value!")
        } else {
            arguments[index] = Double(readedLine!)!
            isCorrect = true
            return
        }
    }
}

func isNumber(a: String) -> Bool {
    let regEx = "-?[0-9]+.?[0-9]*$"
    let preficate = NSPredicate(format:"SELF MATCHES %@", regEx)
    let isNumber = preficate.evaluate(with: a)

    return isNumber
}

func isEmpty(a: String) -> Bool {
    return a == ""
}

func calcDiscriminant(args: Array<Double>) {
    let discriminant = (args[1] * args[1]) - (4 * args[0] * args[2])
    let sqrtDiscriminant = sqrt(Double(discriminant))
    
    print("D = \(discriminant)")
    
    if discriminant < 0 {
        print("No solutions")
    } else if discriminant == 0 {
        print("x1 = \(-args[1] / 2 * args[0])")
    } else if discriminant > 0 {
        print("x1 = \((-args[1] + sqrtDiscriminant) / (2 * args[0]))")
        print("x2 = \((-args[1] - sqrtDiscriminant) / (2 * args[0]))")
    }
}

func isWantToExit() {
    isCorrectNum = false
    print("Do you want to exit? 1 - Yes, 0 - No.")
    
    while !isCorrectNum {
        readedLine = readLine()
        
        if readedLine == "1" {
            isShouldClose = true
            isCorrectNum = true

        } else if readedLine == "0" {
            isShouldClose = false
            isCorrectNum = true
        } else {
            print("Uncorrect value!")
        }
    }
}
