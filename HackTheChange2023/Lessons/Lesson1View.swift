//
//  Lesson1View.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct Lesson1View: View {
    var body: some View {
        ZStack {
            PointsView(100)
            QuestionView("Is Recycling a good thing?", .yes)
            LessonView("Recycling", "You ready?", Image(systemName: "faceid"))
            LessonView("Recycling", "Very cool.", Image(systemName: "faceid"))
        }
    }
}

#Preview {
    Lesson1View()
}
