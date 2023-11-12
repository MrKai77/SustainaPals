//
//  MultiOptionQuestionView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct MultiOptionQuestionView: View {
    @State private var question: String = "AUWduigbf"
    @State private var options: [String] = ["1", "2", "3", "4", "5"]
    @State private var answerIndex: Int = 0

    @State private var didAnswer: Bool = false
    @State private var wasCorrect: Bool = false
    @State private var hasBeenDismissed: Bool = false

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color(.background))
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text(self.question)
                    .font(.title)

                Spacer()

                ForEach(Array(self.options.enumerated()), id: \.element.hash) { index, option in
                    Button(action: {
                        withAnimation(.snappy) {
                            self.didAnswer = true
                        }
                        if index == self.answerIndex {
                            self.wasCorrect = true
                        }
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color(.yesGreen))
                            .overlay {
                                Text("\(option)")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            .frame(height: 50)
                            .padding(.horizontal, 20)
                    })
                }

                if self.didAnswer {
                    Spacer()
                }

                Spacer()
            }

            VStack {
                Spacer()

                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(self.wasCorrect ? "Correct!" : "Incorrect :(")
                                .font(.title2)
                                .fontWeight(.bold)
                            if !self.wasCorrect {
                                Text("Correct answer was: \(self.options[answerIndex])")
                            }
                        }
                        Spacer()
                    }

                    Button(action: {
                        withAnimation(.easeOut) {
                            self.hasBeenDismissed = true
                        }
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color(.yesGreen))
                            .overlay {
                                Text("Next")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                    })
                    .frame(height: 50)
                }
                .padding(20)
                .background(Color(.background))
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .strokeBorder(self.wasCorrect ? Color(.yesGreen) : Color(.noRed), lineWidth: 4)
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(self.wasCorrect ? Color(.yesGreen) : Color(.noRed))
                            .opacity(0.2)
                    }
                }
                .padding(10)
            }
            .offset(y: self.didAnswer ? 0 : 300)
        }
        .rotation3DEffect(
            .degrees(
                self.hasBeenDismissed ? -90 : 0
            ),
            axis: (x: 0, y: 1, z: 0),
            anchor: .leading
        )
        .allowsHitTesting(!self.hasBeenDismissed)
    }
}

#Preview {
    MultiOptionQuestionView()
}
