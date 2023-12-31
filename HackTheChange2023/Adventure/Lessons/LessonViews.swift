//
//  LessonViews.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI
import SwiftyJSON

struct Lesson1View: View {
    @AppStorage("UserCompleted") var userCompleted: Int = 0
    @AppStorage("LeafCoins") var leafCoins: Int = 0

    @State var question1Correct: Bool = false
    @State var pagesLeft: Int = 4
    @State var pages: [any Page] = []

    var body: some View {
        ZStack {
            PointsView(self.question1Correct ? 100 : 0)

            ForEach(self.pages.reversed(), id: \.id) { page in
                if page is Lesson {
                    LessonView(
                        (page as! Lesson).title,
                        (page as! Lesson).description,
                        Image((page as! Lesson).imageName),
                        $pagesLeft
                    )
                }

                if page is BooleanQuestion {
                    BooleanQuestionView(
                        (page as! BooleanQuestion).title,
                        (page as! BooleanQuestion).answer,
                        $question1Correct,
                        $pagesLeft
                    )
                }
            }
        }
        .onChange(of: self.pagesLeft) {
            if self.pagesLeft == 0 && question1Correct {
                self.userCompleted = max(1, self.userCompleted)
                self.leafCoins += 100
            }
        }
        .onAppear {
            self.pages = parseJSON(file: lesson1) ?? []
        }
    }
}

struct Lesson2View: View {
    @AppStorage("UserCompleted") var userCompleted: Int = 0
    @AppStorage("LeafCoins") var leafCoins: Int = 0

    @State var question1Correct: Bool = false
    @State var pagesLeft: Int = 4

    var body: some View {
        ZStack {
            PointsView(self.question1Correct ? 100 : 0)
            BooleanQuestionView(
                "Can a smartphone become compost?",
                .no,
                $question1Correct,
                $pagesLeft
            )
            LessonView(
                "Composting",
                "Composting is like a recycling party for food scraps. Instead of letting them go to waste in the trash, we turn them into something awesome that helps plants and the Earth. It's a bit like making a yummy treat for the garden with the leftovers from your lunch!",
                Image(.compost),
                $pagesLeft
            )
            LessonView(
                "Composting",
                "Over time, the scraps start to change into something amazing called compost. Compost is like superfood for plants! When you sprinkle it in your garden or on plants, it helps them grow strong and healthy. It's like giving them a tasty treat.",
                Image(.compost),
                $pagesLeft
            )
            LessonView(
                "Composting",
                "Imagine you have some leftover fruits and veggies from your lunch. Instead of throwing them in the trash, you decide to put them in a special bin outside. This bin is like a magical kitchen for the scraps.",
                Image(.compost),
                $pagesLeft
            )
        }
        .onChange(of: self.pagesLeft) {
            if self.pagesLeft == 0 && question1Correct {
                self.userCompleted = max(2, self.userCompleted)
                self.leafCoins += 100
            }
        }
    }
}

struct Lesson3View: View {
    @AppStorage("UserCompleted") var userCompleted: Int = 0
    @AppStorage("LeafCoins") var leafCoins: Int = 0

    @State var question1Correct: Bool = false
    @State var pagesLeft: Int = 3

    var body: some View {
        ZStack {
            PointsView(self.question1Correct ? 100 : 0)
            BooleanQuestionView(
                "Does donating cost money?",
                .no,
                $question1Correct,
                $pagesLeft
            )
            LessonView(
                "Donating",
                "So, you gather the toys or clothes that are still in good shape, put them in a box, and give them to a place that helps share them with other kids. It's like making a gift to your friends you haven't met yet! Donating is a way to be kind and helpful by giving things you don't need to others who can enjoy and use them.",
                Image(.donation),
                $pagesLeft
            )
            LessonView(
                "Donating",
                "Imagine you have a bunch of toys or clothes that you don't use or play with anymore. Donating is like sharing those things with other kids who might not have as many toys or clothes.",
                Image(.donation),
                $pagesLeft
            )
        }
        .onChange(of: self.pagesLeft) {
            if self.pagesLeft == 0 && question1Correct {
                self.userCompleted = max(3, self.userCompleted)
                self.leafCoins += 100
            }
        }
    }
}

struct Lesson4View: View {
    @AppStorage("UserCompleted") var userCompleted: Int = 0
    @AppStorage("LeafCoins") var leafCoins: Int = 0

    @State var question1Correct: Bool = false
    @State var pagesLeft: Int = 4

    var body: some View {
        ZStack {
            PointsView(self.question1Correct ? 100 : 0)
            BooleanQuestionView(
                "Are landfills permanent?",
                .yes,
                $question1Correct,
                $pagesLeft
            )
            LessonView(
                "Landfills",
                "But here's the tricky part: the stuff we throw away doesn't just disappear. Over time, some things can break down or rot, but others stay in the landfill for a really, really long time. Landfills are like big storage places for our trash, and we need to be careful about what we put in them so we can take care of our planet. It's important to recycle and donate what we can so we don't fill up the landfills too quickly.",
                Image(.landfill),
                $pagesLeft
            )
            LessonView(
                "Landfills",
                "Now, imagine that the landfill is like a huge sandwich. We start by putting a layer of trash, then a layer of dirt on top of it, and another layer of trash, and more dirt. We keep doing this until the landfill becomes a bit like a layered cake with trash and dirt.",
                Image(.landfill),
                $pagesLeft
            )
            LessonView(
                "Landfills",
                "Imagine a giant hole in the ground where we throw away things we don't need anymore, like old toys, broken stuff, or things we can't use. This big hole is called a landfill.",
                Image(.landfill),
                $pagesLeft
            )
        }
        .onChange(of: self.pagesLeft) {
            if self.pagesLeft == 0 && question1Correct {
                self.userCompleted = max(4, self.userCompleted)
                self.leafCoins += 100
            }
        }
    }
}

struct Lesson5View: View {
    @AppStorage("UserCompleted") var userCompleted: Int = 0
    @AppStorage("LeafCoins") var leafCoins: Int = 0

    @State var question1Correct: Bool = false
    @State var question2Correct: Bool = false
    @State var question3Correct: Bool = false
    @State var question4Correct: Bool = false
    @State var pagesLeft: Int = 4

    var body: some View {
        ZStack {
            PointsView(Int(calculatePercentage(answers: [question1Correct, question2Correct, question3Correct, question4Correct]) * 400))
            MultiOptionQuestionView(
                "What should we do to take care of our planet and reduce the giant sandwich-like landfill?",
                ["Keep throwing everything away in the landfill", "Only throw away things that break easily", "Recycle, compost and donate when we can", "Build more landfills for extra space"],
                2,
                $question3Correct,
                $pagesLeft
            )
            MultiOptionQuestionView(
                "Why is donating a good idea?",
                ["To show kindness and make people smile", "So everyone can have what they need", "To make our planet healthier", "All of these!"],
                3,
                $question3Correct,
                $pagesLeft
            )
            MultiOptionQuestionView(
                "Which one of these materials is compostable?",
                ["Book", "Orange Peel", "Wooden Chair", "iPhone"],
                1,
                $question2Correct,
                $pagesLeft
            )
            MultiOptionQuestionView(
                "Which one of these materials is not recyclable?",
                ["Cardboard Box", "Wooden Chair", "Styrofoam Cup", "Aluminum Soda Can"],
                2,
                $question1Correct,
                $pagesLeft
            )
        }
        .onChange(of: self.pagesLeft) {
            if self.pagesLeft == 0 {
                self.leafCoins += Int(calculatePercentage(answers: [question1Correct, question2Correct, question3Correct, question4Correct]) * 400)

                if calculatePercentage(answers: [question1Correct, question2Correct, question3Correct, question4Correct]) == 1 {
                    self.userCompleted = max(5, self.userCompleted)
                }
            }
        }
    }
}

fileprivate func calculatePercentage(answers: [Bool]) -> Double {
    let count = answers.count
    var correct = 1

    for answer in answers {
        if answer == true {
            correct += 1
        }
    }

    return Double(correct) / Double(count)
}

fileprivate func parseJSON(file: String) -> [any Page]? {
    var pages: [any Page] = []

    // Load the JSON file data
    guard let dataFromString = lesson1.data(using: .utf8, allowLossyConversion: false),
          let json = try? JSON(data: dataFromString) else { return nil }

    for i in 1...json.count {
        let data = json[String(i)]

        if data["type"] == "lesson" {
            pages.append(
                Lesson(
                    title: data["title"].stringValue,
                    description: data["description"].stringValue,
                    imageName: data["imageName"].stringValue
                )
            )
        }

        if data["type"] == "booleanQuestion" {
            pages.append(
                BooleanQuestion(
                    title: data["title"].stringValue,
                    answer: data["answer"].stringValue.lowercased() == "yes" ? .yes : .no
                )
            )
        }
    }

    return pages
}
