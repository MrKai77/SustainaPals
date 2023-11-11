//
//  QuestionView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct QuestionView: View {
    @State var question: String = "Is it really?"
    @State var options: [Option] = [.yes, .no]
    @State var answer: Option = .no

    @State private var draggedItem: String? = nil
    @State private var dropZoneActive: Bool = false

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
                    .onDrag {
                        let itemProvider = NSItemProvider(object: self.question as NSItemProviderWriting)
                        return itemProvider
                    }
                    .draggable(self.question, preview: {
                      Text("Dragging...")
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(25)
                    })
                    .disabled(self.didAnswer)

                Spacer()

                HStack {
                    Spacer()

                    ForEach(self.options) { option in
                        ZStack {
                            Image(.bin)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(30)
                            option.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(60)
                                .foregroundStyle(option.color)
                        }
                        .dropDestination(for: String.self) { items, location in
                            guard items.first == self.question else { return false }

                            withAnimation(.snappy) {
                                self.didAnswer = true
                            }
                            if option == self.answer {
                                self.wasCorrect = true
                            } else {
                                self.wasCorrect = false
                            }
                            return true
                        }
                    }

                    Spacer()
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
                                Text("Correct answer was: \(self.answer.rawValue)")
                            }
                        }
                        Spacer()
                    }

                    HStack {
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
                    }
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
    }
}

enum Option: String, Identifiable {
    var id: Self { self }

    case yes = "Yes"
    case no = "No"

    var image: Image {
        switch self {
        case .yes: Image(systemName: "checkmark.square.fill")
        case .no: Image(systemName: "xmark.square.fill")
        }
    }

    var color: Color {
        switch self {
        case .yes: Color(.yesGreen)
        case .no: Color(.noRed)
        }
    }
}

#Preview {
    QuestionView()
}