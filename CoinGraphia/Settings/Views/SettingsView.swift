//
//  SettingsView.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 27/06/23.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.apple.com/in/")!
    let twitterURL = URL(string: "https://www.twitter.com/LiGHT_XO1")!
    let githubURL = URL(string: "https://www.github.com/NishayKumar")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    
    
    var body: some View {
        NavigationView{
            List {
                header
                coingecko
                developerSection
                applicationSection
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private var header: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The crypto app provides real-time cryptocurrency information and portfolio management, making it easy to track prices and manage investments in the cryptocurrency market.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
                
            }
            .padding(.vertical)
            Group {
                Link("Twitter", destination: twitterURL)
                Link("GitHub", destination: githubURL )
            }
            .font(.headline)
            .accentColor(.blue)
        }
        header: {
            Text("Header")
        }
    }
    
    private var coingecko: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text("CoinGecko provides a fundamental analysis of the digital currency market. CoinGecko API is used in this application")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
                
            }
            .padding(.vertical)
            Group {
                Link("CoinGecko", destination: coingeckoURL)
            }
            .font(.headline)
            .accentColor(.blue)
        }
        header: {
            Text("CoinGecko")
        }
    }
    
    private var developerSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text("Nishay Kumar, a student from IIIT Tiruchirappalli, is a passionate developer with a focus on Apple technologies. He creates seamless user experiences and explores the latest advancements in iOS app development.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
                
            }
            .padding(.vertical)
            Group {
                Link("Twitter", destination: twitterURL)
                Link("GitHub", destination: githubURL )
            }
            .font(.headline)
            .accentColor(.blue)
        }
        header: {
            Text("Developer")
        }
    }
    private var applicationSection: some View {
        Section {
            Group {
                Link("Terms of Services", destination: twitterURL)
                Link("Privacy Policy", destination: githubURL )
                Link("Learn More", destination: githubURL )
            }
            .font(.headline)
            .accentColor(.blue)
        }
        header: {
            Text("Application")
        }
    }
}
