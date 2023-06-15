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
//        GeometryReader{ geometry in
            HStack(spacing: 0, content: {
                leftColumn
                
                Spacer()
                
                if showHoldingValue {
                    centerColumn
                }
                
                rightColumn
            })
            .font(.subheadline)
//            .frame(width: geometry.size.width )
            .background(
                Color.theme.green
//                Color.theme.background.opacity(0.001)
//                .clear
            )
            
//        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingValue: true)
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
//            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(.theme.accent)
        }
    }
    private var centerColumn: some View {
        VStack(alignment: .trailing, content: {
            Text(coin.currentHoldingValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        })
        .foregroundColor(.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing, content: {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .foregroundColor(.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                        .theme.green : .theme.red
                )
        })
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)  // this looks good and works only on potrait mode.
    }
}
