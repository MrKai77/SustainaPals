//
//  LessonViews.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct Lesson1View: View {
    var body: some View {
        ZStack {
            PointsView(100)
            BooleanQuestionView("Is Recycling a good thing?", .yes)
            LessonView("Recycling", "You ready?", Image(systemName: "faceid"))
            LessonView("Recycling", "Very cool.", Image(systemName: "faceid"))
            MultiOptionQuestionView()
        }
    }
}

struct Lesson2View: View {
    var body: some View {
        ZStack {
            PointsView(100)
            BooleanQuestionView("Is Recycling a good thing?", .yes)
            LessonView("Recycling", "You ready?", Image(systemName: "faceid"))
            LessonView("Recycling", "Very cool.", Image(systemName: "faceid"))
        }
    }
}

struct Lesson3View: View {
    var body: some View {
        ZStack {
            PointsView(100)
            BooleanQuestionView("Is Recycling a good thing?", .yes)
            LessonView("Recycling", "You ready?", Image(systemName: "faceid"))
            LessonView("Recycling", "Very cool.", Image(systemName: "faceid"))
        }
    }
}

struct Lesson4View: View {
    var body: some View {
        ZStack {
            PointsView(100)
            BooleanQuestionView("Is Recycling a good thing?", .yes)
            LessonView("Recycling", "You ready?", Image(systemName: "faceid"))
            LessonView("Recycling", "Very cool.", Image(systemName: "faceid"))
        }
    }
}

struct Lesson5View: View {
    var body: some View {
        ZStack {
            PointsView(100)
            BooleanQuestionView("Is Recycling a good thing?", .yes)
            LessonView("Recycling", "You ready?", Image(systemName: "faceid"))
            LessonView("Recycling", "Very cool.", Image(systemName: "faceid"))
        }
    }
}
