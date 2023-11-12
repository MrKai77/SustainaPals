//
//  Page.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-12.
//

import Foundation

protocol Page: Codable, Identifiable, Hashable {
    var id: UUID { get set }
}

struct Lesson: Page {
    var id = UUID()

    let title: String
    let description: String
    let imageName: String
}

struct BooleanQuestion: Page {
    var id = UUID()

    let title: String
    let answer: BooleanOption
}
