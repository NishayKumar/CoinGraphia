
//
//  PortfolioView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 08/06/23.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoins: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckMark: Bool = false
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    
                    if selectedCoins != nil {
                        portfolioInput
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }
            })
            .onChange(of: vm.searchText) { value in
                if value == "" {
                    removeSelectedCoins()
                }
            }
        }
    }
}


struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
    
}

extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoins?.id == coin.id ? Color.theme.green : .clear, lineWidth: 1)
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        }
    }
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoins = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: {$0.id == coin.id}),
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
        } else {
            quantityText = ""
        }
    }
    
    private func getCurrentValue() -> Double{
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoins?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInput: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current Price Of \(selectedCoins?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoins?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack {
                Text("Amount Holdings:")
                
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
                
            }
            Divider()
            HStack{
                Text("Current Value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(.none, value: selectedCoins?.symbol)
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1.0 : 0.0)
            Button(action: {
                saveButtonPressed()
            }, label: {
                Text("SAVE")
            })
            .opacity(selectedCoins != nil && selectedCoins?.currentPrice != Double(quantityText) ? 1.0 : 0.0)
            
        }
        .font(.headline)
    }
    
    private func saveButtonPressed() {
        guard let coin = selectedCoins, let amount = Double(quantityText) else { return }
        
        //save to portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        
        //show checkmark
        withAnimation(.easeIn) {
            showCheckMark = true
            removeSelectedCoins()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckMark = false
            }
        }
        
    }
    private func removeSelectedCoins() {
        selectedCoins = nil
        vm.searchText = ""
    }
    
}

