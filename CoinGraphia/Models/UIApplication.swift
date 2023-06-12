//
//  UIApplication.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 11/06/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
