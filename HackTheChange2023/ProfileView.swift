//
//  ProfileView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color(.background))
                    .ignoresSafeArea()

                NavigationLink(destination: ProfileView()) {
                    Text("Do Something")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
