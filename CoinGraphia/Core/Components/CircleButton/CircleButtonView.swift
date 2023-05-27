//
//  CircleButtonView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 28/05/23.
//

import SwiftUI

struct CircleButtonView: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.headline)
            .foregroundColor(.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(.theme.background)
            )
            .shadow(color: .theme.accent.opacity(0.25),
                    radius: 10, x: 0, y: 0)
            .padding()
    }

}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView()
            .previewLayout(.sizeThatFits)
//            .environment(\.colorScheme, .dark )
    }
}
