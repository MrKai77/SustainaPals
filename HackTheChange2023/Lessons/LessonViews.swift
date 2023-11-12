//
//  LessonViews.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct Lesson1View: View {
    @State var question1Correct: Bool = false
    var body: some View {
        ZStack {
            PointsView(self.question1Correct ? 100 : 0)
            BooleanQuestionView(
                "Can recycling turn old soda cans into a bicycle?",
                .yes,
                $question1Correct
            )
            LessonView(
                "Recycling",
                "Recycling is like giving our old stuff a chance to be born again as something fresh and useful. It's a way of being kind to our planet by using things in a smart way and not making too much waste. So, in a nutshell, recycling is like a magical process that turns old things into brand new things!",
                Image(systemName: "faceid")
            )
            LessonView(
                "Recycling",
                "When we recycle, we collect these used items and send them to a special place called a recycling center. There, they sort and clean the materials. Then, these materials are turned into new things. For example, an old soda can might become a brand new can or even a bicycle!",
                Image(systemName: "faceid")
            )
            LessonView(
                "Recycling",
                "Imagine you have a toy made of building blocks. Now, instead of throwing those blocks away when you're done playing, you decide to take them apart and use them to build a completely new toy. That's a bit like what recycling does, but with things we use every day, like paper, plastic, and metal.",
                Image(systemName: "faceid")
            )
        }
    }
}

struct Lesson2View: View {
    @State var question1Correct: Bool = false
    var body: some View {
        ZStack {
            PointsView(self.question1Correct ? 100 : 0)
            BooleanQuestionView(
                "Can a smartphone become compost?",
                .no,
                $question1Correct
            )
            LessonView(
                "Composting",
                "Composting is like a recycling party for food scraps. Instead of letting them go to waste in the trash, we turn them into something awesome that helps plants and the Earth. It's a bit like making a yummy treat for the garden with the leftovers from your lunch!",
                Image(systemName: "faceid")
            )
            LessonView(
                "Composting",
                "Over time, the scraps start to change into something amazing called compost. Compost is like superfood for plants! When you sprinkle it in your garden or on plants, it helps them grow strong and healthy. It's like giving them a tasty treat.",
                Image(systemName: "faceid")
            )
            LessonView(
                "Composting",
                "Imagine you have some leftover fruits and veggies from your lunch. Instead of throwing them in the trash, you decide to put them in a special bin outside. This bin is like a magical kitchen for the scraps.",
                Image(systemName: "faceid")
            )

        }
    }
}

struct Lesson3View: View {
    @State var question1Correct: Bool = false
    var body: some View {
        ZStack {
            PointsView(self.question1Correct ? 100 : 0)
            BooleanQuestionView(
                "Does donating cost money?",
                .no,
                $question1Correct
            )
            LessonView(
                "Donating",
                "So, you gather the toys or clothes that are still in good shape, put them in a box, and give them to a place that helps share them with other kids. It's like making a gift to your friends you haven't met yet! Donating is a way to be kind and helpful by giving things you don't need to others who can enjoy and use them.",
                Image(systemName: "faceid")
            )
            LessonView(
                "Donating",
                "Imagine you have a bunch of toys or clothes that you don't use or play with anymore. Donating is like sharing those things with other kids who might not have as many toys or clothes.",
                Image(systemName: "faceid")
            )
        }
    }
}

struct Lesson4View: View {
    @State var question1Correct: Bool = false
    var body: some View {
        ZStack {
            PointsView(self.question1Correct ? 100 : 0)
            BooleanQuestionView("Are landfills permanent?", .no, $question1Correct)
            LessonView("Landfills", "But here's the tricky part: the stuff we throw away doesn't just disappear. Over time, some things can break down or rot, but others stay in the landfill for a really, really long time. Landfills are like big storage places for our trash, and we need to be careful about what we put in them so we can take care of our planet. It's important to recycle and donate what we can so we don't fill up the landfills too quickly.", Image(systemName: "faceid"))
            LessonView("Landfills", "Now, imagine that the landfill is like a huge sandwich. We start by putting a layer of trash, then a layer of dirt on top of it, and another layer of trash, and more dirt. We keep doing this until the landfill becomes a bit like a layered cake with trash and dirt.", Image(systemName: "faceid"))
            LessonView("Landfills", "Imagine a giant hole in the ground where we throw away things we don't need anymore, like old toys, broken stuff, or things we can't use. This big hole is called a landfill.", Image(systemName: "faceid"))
        }
    }
}

struct Lesson5View: View {
    @State var question1Correct: Bool = false
    @State var question2Correct: Bool = false
    @State var question3Correct: Bool = false
    @State var question4Correct: Bool = false

    var body: some View {
        ZStack {
            PointsView([question1Correct, question2Correct, question3Correct, question4Correct], maxAmount: 400)
            MultiOptionQuestionView(
                "What should we do to take care of our planet and reduce the giant sandwich-like landfill?",
                ["Keep throwing everything away in the landfill", "Only throw away things that break easily", "Recycle, compost and donate when we can", "Build more landfills for extra space"],
                2,
                $question3Correct
            )
            MultiOptionQuestionView(
                "Why is donating a good idea?",
                ["To show kindness and make people smile", "So everyone can have what they need", "To make our planet healthier", "All of these!"],
                3,
                $question3Correct
            )
            MultiOptionQuestionView(
                "Which one of these materials is compostable?",
                ["Book", "Orange Peel", "Wooden Chair", "iPhone"],
                1,
                $question2Correct
            )
            MultiOptionQuestionView(
                "Which one of these materials is not recyclable?",
                ["Cardboard Box", "Wooden Chair", "Styrofoam Cup", "Aluminum Soda Can"],
                2,
                $question1Correct
            )
        }
    }
}
