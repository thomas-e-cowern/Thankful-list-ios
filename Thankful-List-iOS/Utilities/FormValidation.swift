//
//  FormValidation.swift
//  Thankful-List-iOS
//
//  Created by Thomas Cowern on 7/3/25.
//

import Foundation

@propertyWrapper
struct Validated<Value> {
    private var value: Value
    private let validator: (Value) -> Bool

    init(wrappedValue: Value, validator: @escaping (Value) -> Bool) {
        self.value = wrappedValue
        self.validator = validator
    }

    var wrappedValue: Value {
        get { return value }
        set {
            if validator(newValue) {
                value = newValue
            }
        }
    }
}
