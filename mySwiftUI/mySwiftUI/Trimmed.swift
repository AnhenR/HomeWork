//
//  Trimmed.swift
//  mySwiftUI
//
//  Created by user on 16.09.22.
//

import Foundation

@propertyWrapper

struct Trimmed {
    private(set) var value: String = " "
    
    var wrappedValue: String {
        get { return value}
        set { value = removeExtraSpaces(newValue: newValue) }
    }
    
    init(initialValue: String) {
        self.wrappedValue = initialValue
    }
    
    mutating func removeExtraSpaces(newValue: String) -> String {
        var data  = ""
        var numberOfSpace = 0
        
        newValue.forEach{ item in
            if item == " " {
                numberOfSpace = numberOfSpace + 1
            }else {
                numberOfSpace = 0
            }
            if numberOfSpace == 1 || numberOfSpace == 0 {
                data.append(item)
            }
        }
        let newData = data.trimmingCharacters(in: .whitespacesAndNewlines)
        return newData
    }
}

@propertyWrapper

struct Сapital {
    private(set) var value: String = " "
    
    var wrappedValue: String {
        get { return value}
        set {value = uppercaseLetters(newValue: newValue)}
    }
    
    init(initialValue: String) {
        self.wrappedValue = initialValue
    }
    
    mutating func uppercaseLetters(newValue: String) -> String {
        var data  = ""
        var dot = 0
        newValue.enumerated().forEach{ index, item in
            if item == "." {
                dot += 1
                data.append(item)
            } else if dot == 1 && item != " " {
                data.append(item.uppercased())
                dot = 0
            } else {
                data.append(item)
            }
        }
        var dataSpaces = data.trimmingCharacters(in: .whitespacesAndNewlines)
        var dataUp = dataSpaces.first!.uppercased()
        var dataDrop = dataSpaces.dropFirst()
        return dataUp + dataDrop
    }
}

//@propertyWrapper
//
//struct Versioned<Value> {
//    private var value: Value
//    private(set) var timestampedValues: [(Date, Value)] = []
//
//    var wrappedValue: Value {
//        get { value }
//
//        set {
//            defer { timestampedValues.append((Date(), value)) }
//            value = newValue
//        }
//    }
//
//    init(initialValue value: Value) {
//        self.wrappedValue = value
//    }
//}
