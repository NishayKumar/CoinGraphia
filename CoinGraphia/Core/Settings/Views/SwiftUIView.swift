//
//  SwiftUIView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 27/06/23.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var isShowingSheet: Bool = false
    var body: some View {
        VStack {
            Button(action: {
                isShowingSheet.toggle()
            }, label: {
                Text("Hello")
                    .frame(width: 100,height: 50)
            })
            .border(.pink)
            .background(.pink)
            .font(.title)
            .accentColor(.black)
            .cornerRadius(20)
            
            
        }
        .sheet(isPresented: $isShowingSheet) {
            NavigationView {
                VStack {
                    Text("hello")
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        XMarkButton()
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
