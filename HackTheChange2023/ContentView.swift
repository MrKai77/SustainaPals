//
//  ContentView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("LeafCoins") var leafCoins: Int = 0
    @AppStorage("CurrentTab") var currentTab: Int = 1
    @AppStorage("UserCompleted") var userCompleted: Int = 0

    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "Background")
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .overlay {
                        HStack {
                            Label("\(leafCoins)", systemImage: "leaf.circle")
                                .foregroundStyle(.yellow)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                    }

                    .padding([.bottom, .horizontal], 20)
                    .foregroundStyle(Color(.yesGreen))
                    .shadow(radius: 10)
                    .background(Color(.background))

                TabView(selection: $currentTab) {
                    ShopView()
                        .tabItem {
                            Label(
                                "Shop",
                                systemImage: "handbag"
                            )
                        }
                        .tag(0)

                    AdventureView()
                        .tabItem {
                            Label(
                                "Home",
                                systemImage: "point.topleft.down.to.point.bottomright.filled.curvepath"
                            )
                        }
                        .tag(1)

                    ProfileView()
                        .tabItem {
                            Label(
                                "Profile",
                                systemImage: "person.crop.circle"
                            )
                        }
                        .tag(2)
                }
            }
        }
        .onAppear {
            self.userCompleted = 3
            self.leafCoins = 0
        }
    }
}

#Preview {
    ContentView()
}
