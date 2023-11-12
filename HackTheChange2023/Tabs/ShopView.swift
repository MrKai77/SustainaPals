//
//  ShopView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct ShopView: View {
    @AppStorage("LeafCoins") var leafCoins: Int = 0
    @State var didPurchaseAlert: Bool = false
    @State var cannotAffordAlert: Bool = false

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color(.sustainableGreen))
                .ignoresSafeArea()

            ScrollView {
                VStack {
                    HStack {
                        ForEach(Accessory.allCases) { item in
                            if item.imageName != "" {
                                Button(action: {
                                    if leafCoins >= 500 {
                                        leafCoins -= 500
                                        self.didPurchaseAlert.toggle()
                                    } else {
                                        cannotAffordAlert.toggle()
                                    }
                                }, label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundStyle(.sustainableBrown.opacity(0.5))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 15)
                                                .strokeBorder(.sustainableBrown, lineWidth: 5)
                                        }
                                        .shadow(color: .black.opacity(0.2), radius: 20)
                                        .overlay {
                                            Image(item.imageName)
                                                .scaleEffect(0.4)
                                                .offset(y: item == .accessory1 ? -30 : 50)
                                        }
                                        .overlay {
                                            VStack {
                                                Spacer()
                                                RoundedRectangle(cornerRadius: 15)
                                                    .foregroundStyle(.sustainableBrown)
                                                    .frame(height: 50)
                                                    .overlay {
                                                        Label("500", systemImage: "leaf.circle")
                                                            .foregroundStyle(.sustainableWhite)
                                                            .font(.title)
                                                            .fontWeight(.bold)
                                                    }
                                            }
                                        }
                                })
                           }
                        }
                    }

                    HStack {
                        ForEach(Hair.allCases) { item in
                            if item.imageName != "" {
                                Button(action: {
                                    if leafCoins >= 500 {
                                        leafCoins -= 500
                                        self.didPurchaseAlert.toggle()
                                    } else {
                                        cannotAffordAlert.toggle()
                                    }
                                }, label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundStyle(.sustainableBrown.opacity(0.5))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 15)
                                                .strokeBorder(.sustainableBrown, lineWidth: 5)
                                        }
                                        .shadow(color: .black.opacity(0.2), radius: 20)
                                        .overlay {
                                            Image(item.imageName)
                                                .scaleEffect(0.2)
                                                .offset(y: -30)
                                        }
                                        .overlay {
                                            VStack {
                                                Spacer()
                                                RoundedRectangle(cornerRadius: 15)
                                                    .foregroundStyle(.sustainableBrown)
                                                    .frame(height: 50)
                                                    .overlay {
                                                        Label("500", systemImage: "leaf.circle")
                                                            .foregroundStyle(.sustainableWhite)
                                                            .font(.title)
                                                            .fontWeight(.bold)
                                                    }
                                            }
                                        }
                                })
                            }
                        }
                    }

                    HStack {
                        ForEach(Shirt.allCases) { item in
                            if item.imageName != "" {
                                Button(action: {
                                    if leafCoins >= 500 {
                                        leafCoins -= 500
                                        self.didPurchaseAlert.toggle()
                                    } else {
                                        cannotAffordAlert.toggle()
                                    }
                                }, label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundStyle(.sustainableBrown.opacity(0.5))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 15)
                                                .strokeBorder(.sustainableBrown, lineWidth: 5)
                                        }
                                        .shadow(color: .black.opacity(0.2), radius: 20)
                                        .overlay {
                                            Image(item.imageName)
                                                .scaleEffect(0.2)
                                                .offset(y: -60)
                                        }
                                        .overlay {
                                            VStack {
                                                Spacer()
                                                RoundedRectangle(cornerRadius: 15)
                                                    .foregroundStyle(.sustainableBrown)
                                                    .frame(height: 50)
                                                    .overlay {
                                                        Label("500", systemImage: "leaf.circle")
                                                            .foregroundStyle(.sustainableWhite)
                                                            .font(.title)
                                                            .fontWeight(.bold)
                                                    }
                                            }
                                        }
                                })
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .alert("Your purchase was successful!", isPresented: $didPurchaseAlert) {
                Button("Yay!", role: .cancel) { }
            }
            .alert("You can't afford that yet!", isPresented: $cannotAffordAlert) {
                Button("I'll practice more", role: .cancel) { }
            }
        }
    }
}

#Preview {
    ShopView()
}
