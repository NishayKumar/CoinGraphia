//
//  String.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 26/06/23.
//

import Foundation

extension String {
    
    // removes html tags 
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
