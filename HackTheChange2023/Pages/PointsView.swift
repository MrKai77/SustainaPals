//
//  PointsView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct PointsView: View {
    @Environment(\.dismiss) var dismiss
    let amount: Int

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

                Image("custom.leaf.circle.badge.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(80)

                Text("You just earned \(amount) Leaf Coins!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Spacer()

                Button(action: {

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
