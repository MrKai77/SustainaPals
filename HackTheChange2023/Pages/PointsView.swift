//
//  PointsView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct PointsView: View {
    @AppStorage("CurrentTab") var currentTab: Int = 1
    @Environment(\.dismiss) var dismiss
    var amount: Int

    init(_ amount: Int) {
        self.amount = amount
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color(.background))
                .ignoresSafeArea()

            VStack {
                Spacer()

                if self.amount == 0 {
                    Image(systemName: "leaf.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(80)
                } else {
                    Image("custom.leaf.circle.badge.arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(80)
                }

                Text(self.amount == 0 ? "You didn't earn any Leaf Coins :(" : "You just earned \(amount) Leaf Coins!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Spacer()

                if self.amount != 0 {
                    Button(action: {
                        self.currentTab = 0
                        dismiss()
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color(.yesGreen))
                            .overlay {
                                Text("Open Shop")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                    })
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }

                Button(action: {
                    dismiss()
                }, label: {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(.yesGreen))
                        .overlay {
                            Text("Exit")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                })
                .frame(height: 50)
                .padding(.horizontal, 20)

                Spacer()
            }
        }
        .foregroundStyle(Color(.yesGreen))
    }
}
