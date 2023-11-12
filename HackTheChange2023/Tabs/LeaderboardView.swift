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
                            CharacterView(eyes: .eyes2, nose: .nose1, mouth: .mouth2, accessory: .accessory2, shirt: .shirt1, hair: .hair2, bodyColor: .teal, hairColor: .brown, shirtColor: .black)
                                .scaleEffect(0.125)
                                .frame(width: 70)

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
                    .frame(height: 100)
                    .foregroundStyle(.sustainableBrown.opacity(0.5))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(.sustainableBrown, lineWidth: 5)
                    }
                    .shadow(color: .black.opacity(0.2), radius: 20)
                    .overlay {
                        HStack {
                            CharacterView(eyes: .eyes1, nose: .nose2, mouth: .mouth1, accessory: .none, shirt: .shirt2, hair: .hair1, bodyColor: .mint, hairColor: .black, shirtColor: .blue)
                                .scaleEffect(0.125)
                                .frame(width: 70)

                            Text("Eric")
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.sustainableRed)
                        }
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(20)
                    }
                    .padding(10)

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
                            CharacterView(eyes: .eyes2, nose: .nose1, mouth: .mouth2, accessory: .accessory1, shirt: .shirt1, hair: .hair1, bodyColor: .cyan, hairColor: .black, shirtColor: .blue)
                                .scaleEffect(0.125)
                                .frame(width: 70)

                            Text("Adly")
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.sustainableRed)
                        }
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(20)
                    }
                    .padding(10)

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
                            CharacterView()
                                .scaleEffect(0.125)
                                .frame(width: 70)

                            Text("You")
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
