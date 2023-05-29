//
//  CiricleButtonAnimationView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 28/05/23.
//

import SwiftUI

struct CiricleButtonAnimationView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : .none, value: animate)
    }
}

struct CiricleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CiricleButtonAnimationView(animate: .constant(false))
    }
}
