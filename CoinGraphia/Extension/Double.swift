//
//  Double.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 29/05/23.
//

import Foundation

extension Double {
    /// Convert a double into currency with 2-6 decimal place
    ///```
    /// Convert 1234.56 to ₹1,234.56
    /// Convert 12.3456 to ₹12.3456
    /// Convert 0.123456 to ₹0.123456
    ///
    ///```
    
    
    
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter ()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current // ‹- default value
        formatter.currencyCode = "inr" // <- change currency
        formatter.currencySymbol = "₹" // ‹- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    ///     Convert a double into currency as a String with 2-6 decimal place
    ///```
    /// Convert 1234.56 to "₹1,234.56"
    /// Convert 12.3456 to "₹12.3456"
    /// Convert 0.123456 to "₹0.123456"
    ///```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "₹00.00"
    }
    
    
    ///     Convert a Double into a String representation
    ///```
    /// Convert 1.23456 to "1.23"
    ///```
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    ///     Convert a Double into a String representation with percentage symbol
    ///```
    /// Convert 1.23456 to "1.23"
    ///```
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
