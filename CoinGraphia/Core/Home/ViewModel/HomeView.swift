//
//  HomeView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 28/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack{
                homeHeader
//                HomeHeader(showPortfolio: $showPortfolio)
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
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
}



//struct HomeHeader: View {
//    @Binding var showPortfolio: Bool
//    var body: some View  {
//        HStack{
//            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
//                .animation(.none, value: showPortfolio)
//                .background(
//                    CiricleButtonAnimationView(animate: $showPortfolio)
//                )
//            Spacer()
//            Text(showPortfolio ? "Portfolio" : "Live Prices")
//                .animation(.none, value: showPortfolio)
//                .font(.headline)
//                .fontWeight(.heavy)
//                .foregroundColor(.theme.accent)
//            Spacer()
//            CircleButtonView(iconName: "chevron.right")
//                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
//                .onTapGesture {
//                    withAnimation(.spring()){
//                        showPortfolio.toggle()
//                    }
//                }
//
//        }
//    }
//}
//
