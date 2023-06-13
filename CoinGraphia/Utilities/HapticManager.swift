//
//  HapticManager.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 13/06/23.
//

import Foundation
import SwiftUI

class HapticManager {
    
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
