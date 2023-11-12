//
//  AdventureView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct AdventureView: View {
    @State var isLesson1Presented = false
    @State var isLesson2Presented = false
    @State var isLesson3Presented = false
    @State var isLesson4Presented = false
    @State var isLesson5Presented = false

    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color(.background))
                    .ignoresSafeArea()

                ZStack {
                    Line()
                       .stroke(style: StrokeStyle(lineWidth: 5, dash: [10]))
                       .frame(width: 15)
                       .foregroundStyle(.black.opacity(0.5))

                    VStack(spacing: 20) {

                        Button(action: {
                            self.isLesson5Presented = true
                        }, label: {
                            Image(.level5)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        })
                        .sheet(isPresented: $isLesson2Presented, content: {
                            Lesson5View()
                                .interactiveDismissDisabled()
                        })

                        Spacer()

                        Button(action: {
                            self.isLesson4Presented = true
                        }, label: {
                            Image(.level4)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        })
                        .sheet(isPresented: $isLesson4Presented, content: {
                            Lesson4View()
                                .interactiveDismissDisabled()
                        })

                        Spacer()

                        Button(action: {
                            self.isLesson3Presented = true
                        }, label: {
                            Image(.level3)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        })
                        .sheet(isPresented: $isLesson2Presented, content: {
                            Lesson3View()
                                .interactiveDismissDisabled()
                        })

                        Spacer()

                        Button(action: {
                            self.isLesson2Presented = true
                        }, label: {
                            Image(.level2)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        })
                        .sheet(isPresented: $isLesson2Presented, content: {
                            Lesson2View()
                                .interactiveDismissDisabled()
                        })

                        Spacer()

                        Button(action: {
                            self.isLesson1Presented = true
                        }, label: {
                            Image(.level1)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        })
                        .sheet(isPresented: $isLesson1Presented, content: {
                            Lesson1View()
                                .interactiveDismissDisabled()
                        })
                    }
                }
                .padding(.vertical, 500)
            }
        }
    }
}

#Preview {
    AdventureView()
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}
