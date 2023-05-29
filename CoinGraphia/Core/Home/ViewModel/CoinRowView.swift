//
//  CoinRowView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 29/05/23.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingValue: Bool
    
    var body: some View {
        GeometryReader{ geometry in
            HStack(spacing: 0, content: {
                Text("\(coin.rank)")
                    .font(.caption)
                    .foregroundColor(.theme.secondaryText)
                    .frame(minWidth: 30)
                Circle()
                    .frame(width: 30, height: 30)
                Text(coin.symbol.uppercased())
                    .font(.headline)
                    .padding(.leading, 6)
                    .foregroundColor(.theme.accent)
                Spacer()
                if showHoldingValue {
                    VStack(alignment: .trailing, content: {
                        Text(coin.currentHoldingValue.asCurrencyWith6Decimals())
                            .bold()
                        Text((coin.currentHoldings ?? 0).asNumberString())
                    })
                    .foregroundColor(.theme.accent)
                }
                Spacer()
                VStack(alignment: .trailing, content: {
                    Text(coin.currentPrice.asCurrencyWith6Decimals())
                        .foregroundColor(.theme.accent)
                    Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                        .foregroundColor(
                            (coin.priceChangePercentage24H ?? 0) >= 0 ?
                                .theme.green : .theme.red
                        )
                })
                
                .padding()  // added padding might remove later
//                .frame(height: geometry.size.height) //.. this works as well
//                .frame(width: UIScreen.main.bounds.width / 3)
            })
            .frame(height: geometry.size.height)
//            .frame(width: geometry.size.width)
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingValue: true)
    }
}
