//
//  LessonView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct LessonView: View {
    @State private var title: String
    @State private var description: String
    @State private var image: Image

    @State private var hasBeenDismissed: Bool = false
    @Binding var pagesLeft: Int

    init(_ title: String, _ description: String, _ image: Image, _ pagesLeft: Binding<Int>) {
        self.title = title
        self.description = description
        self.image = image
        self._pagesLeft = pagesLeft
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color(.background))
                .ignoresSafeArea()

            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()

                        Text(self.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Divider()
                            .offset(y: -10)

                        Text(self.description)

                        Spacer()

                        self.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)

                        Spacer()

                        Button(action: {
                            withAnimation(.easeOut) {
                                self.hasBeenDismissed = true
                            }
                            self.pagesLeft -= 1
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

                        Spacer()
                    }
                    Spacer(minLength: 0)
                }
            }
            .padding(20)
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
