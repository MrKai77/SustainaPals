//
//  AdventureView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct AdventureView: View {
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

                        NavigationLink(destination: EmptyView()) {
                            Image(.level5)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }

                        Spacer()

                        NavigationLink(destination: EmptyView()) {
                            Image(.level4)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }

                        Spacer()

                        NavigationLink(destination: EmptyView()) {
                            Image(.level3)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }

                        Spacer()

                        NavigationLink(destination: EmptyView()) {
                            Image(.level2)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }

                        Spacer()

                        NavigationLink(destination: Lesson1View()) {
                            Image(.level1)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }
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
