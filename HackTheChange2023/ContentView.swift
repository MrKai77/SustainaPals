//
//  ContentView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct ContentView: View {

    // Default tab is the home tab
    @State private var currentTab = 1

    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "Background")
    }

    var body: some View {
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

#Preview {
    ContentView()
}
