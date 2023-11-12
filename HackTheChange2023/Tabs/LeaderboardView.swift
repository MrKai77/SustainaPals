//
//  LeaderboardView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-12.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color(.sustainableGreen))
                .ignoresSafeArea()

            VStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 100)
                    .foregroundStyle(.sustainableBrown.opacity(0.5))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(.sustainableBrown, lineWidth: 5)
                    }
                    .shadow(color: .black.opacity(0.2), radius: 20)
                    .overlay {
                        HStack {
                            Image(.body)
                                .resizable()
                                .aspectRatio(contentMode: .fit)

                            Text("Kai")
                            Spacer()
                            Image(systemName: "chevron.up")
                                .foregroundStyle(.sustainableYellow)
                        }
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(20)
                    }
                    .padding(10)

                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 80)
                    .foregroundStyle(.sustainableBrown.opacity(0.5))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(.sustainableBrown, lineWidth: 5)
                    }
                    .shadow(color: .black.opacity(0.2), radius: 20)
                    .overlay {
                        HStack {
                            Label("Kai", systemImage: "")
                            Spacer()
                            Image(systemName: "chevron.up")
                                .foregroundStyle(.sustainableYellow)
                        }
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(20)
                    }
                    .padding(10)


                Spacer()
            }
            .foregroundStyle(.sustainableWhite)
        }
    }
}

#Preview {
    LeaderboardView()
}
