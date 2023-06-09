//
//  HomeView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 28/05/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false // animate right
    @State private var showPortfolioView: Bool = false // new sheet
    @State private var showSettingsView: Bool = false // new sheet
    @State private var selectedCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    
    
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                }
                
            NavigationStack{
                VStack{
                    homeHeader
                    HomeStatsView(showPortfolio: $showPortfolio)
//                    SearchBarView(searchText: $vm.searchText)
                    columnTitles
                    if !showPortfolio {
                        allCoinsList
                            .transition(.move(edge: .leading))
                    }
                    if showPortfolio {
                        ZStack(alignment: .top) {
                            if vm.portfolioCoins.isEmpty && vm.searchText.isEmpty {
                                portfolioEmptyText
                            }else {
                                portfolioCoinList
                            }
                        }
                        .transition(.move(edge: .trailing))
                    }
                    Spacer(minLength: 0)
                }
                .searchable(text: $vm.searchText,prompt: "Search for coins")
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
        }
        .background(
            NavigationLink(destination: DetailedLoadingView(coin: $selectedCoin),
                isActive: $showDetailView,
                label: { EmptyView() })
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            HomeView()
                .toolbar(.hidden)
        })
        .environmentObject(dev.homeVM)
        
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }else {
                        showSettingsView.toggle()
                    }
                }
                .background(
                    CiricleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .animation(.none, value: showPortfolio)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
            
        }
    }
    private var allCoinsList: some View {
        List(content: {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingValue: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
                    .contentShape(Rectangle()) // to make the coins tappable
                    .onTapGesture {
                        segue(coin: coin)
                    }
                    .listRowBackground(Color.theme.background)
            }
        })
        .listStyle(.plain)
    }
    private var portfolioCoinList: some View {
        List(content: {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingValue: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
                    .contentShape(Rectangle()) // to make the coins tappable
                    .onTapGesture {
                        segue(coin: coin)
                    }
                    .listRowBackground(Color.theme.background)
            }
        })
        .listStyle(.plain)
    }
    
    private var portfolioEmptyText: some View {
        Text("Click the + button to add coins")
            .font(.callout)
            .foregroundColor(.theme.accent)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .padding(50)
    }
    
    private func segue(coin: CoinModel) {
        selectedCoin = coin
        showDetailView.toggle()
    }
    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4){
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed ) ? 1.0 : 0.0 )
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default){
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }

            Spacer()
            if showPortfolio {
                HStack(spacing: 4){
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingReversed ) ? 1.0 : 0.0 )
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default){
                        vm.sortOption = vm.sortOption == .holdings ? .holdingReversed : .holdings
                    }
                }
                    
            }
            HStack(spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed ) ? 1.0 : 0.0 )
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default){
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                }
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            
            Button(action: {
                withAnimation(.linear(duration: 2.0)){
                    vm.reloadData()
                }
            }, label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
        }
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
        .padding()
    }
}

