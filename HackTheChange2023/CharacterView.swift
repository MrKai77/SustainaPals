//
//  CharacterView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-12.
//

import SwiftUI

struct CharacterView: View {
    @AppStorage("Eyes") var eyes: Eyes = .eyes1
    @AppStorage("Nose") var nose: Nose = .nose1
    @AppStorage("Mouth") var mouth: Mouth = .mouth1
    @AppStorage("Accessory") var accessory: Accessory = .none
    @AppStorage("Shirt") var shirt: Shirt = .shirt2
    @AppStorage("Hair") var hair: Hair = .hair2

    @AppStorage("BodyColor") var bodyColor: Color = Color(.yellow)
    @AppStorage("AccesoryColor") var accessoryColor: Color = Color(.pink)
    @AppStorage("HairColor") var hairColor: Color = Color(.brown)
    @AppStorage("ShirtColor") var shirtColor: Color = Color(.blue)

    var body: some View {
        ZStack {
            Image(.body)
                .foregroundStyle(bodyColor)
                .mask(Image(.body))

            Image(.bodyShadow)
                .background(bodyColor)
                .foregroundStyle(.black.opacity(0.2))
                .mask(Image(.bodyShadow))

            Image(.head)
                .foregroundStyle(bodyColor)

            Image(hair.imageName)
                .foregroundStyle(hairColor)

            Image(hair.accentImageName ?? "")
                .background(hairColor)
                .foregroundStyle(.black.opacity(0.4))
                .mask(Image(hair.accentImageName ?? ""))

            Image(.ear)
                .foregroundStyle(bodyColor)

            Image(.earShadow)
                .background(bodyColor)
                .foregroundStyle(.black.opacity(0.2))
                .mask(Image(.earShadow))

            Image(nose.imageName)
                .background(bodyColor)
                .foregroundStyle(.black.opacity(0.6))
                .mask(Image(nose.imageName))

            Image(mouth.imageName)
                .background(bodyColor)
                .foregroundStyle(.black.opacity(0.6))
                .mask(Image(mouth.imageName))

            Image(eyes.imageName)
                .background(bodyColor)
                .foregroundStyle(.black.opacity(0.6))
                .mask(Image(eyes.imageName))

            Image(shirt.imageName)
                .foregroundStyle(shirtColor)

            Image(accessory.imageName)
                .foregroundStyle(accessoryColor)
        }
    }
}

enum Accessory: String, Identifiable, CaseIterable {
    var id: Self { self }

    case none = ""
    case accessory1 = "Accessory 1"

    var imageName: String {
        self.rawValue
    }
}

enum Shirt: String, Identifiable, CaseIterable {
    var id: Self { self }

    case shirt1 = "Shirt 1"
    case shirt2 = "Shirt 2"

    var imageName: String {
        self.rawValue
    }
}

enum Hair: String, Identifiable, CaseIterable {
    var id: Self { self }

    case hair1 = "Hair 1"
    case hair2 = "Hair 2"

    var imageName: String {
        self.rawValue
    }

    var accentImageName: String? {
        if self == .hair2 {
            return "Hair 2 Accents"
        }
        return nil
    }
}

enum Eyes: String, Identifiable, CaseIterable {
    var id: Self { self }

    case eyes1 = "Eyes 1"
    case eyes2 = "Eyes 2"

    var imageName: String {
        self.rawValue
    }
}

enum Mouth: String, Identifiable, CaseIterable {
    var id: Self { self }

    case mouth1 = "Mouth 1"
    case mouth2 = "Mouth 2"

    var imageName: String {
        self.rawValue
    }
}

enum Nose: String, Identifiable, CaseIterable {
    var id: Self { self }

    case nose1 = "Nose 1"
    case nose2 = "Nose 2"

    var imageName: String {
        self.rawValue
    }
}

#Preview {
    CharacterView()
}


extension Color: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = Data(base64Encoded: rawValue) else{
            self = .black
            return
        }

        do {
            let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor ?? .black
            self = Color(color)
        } catch {
            self = .black
        }
    }

    public var rawValue: String {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()

        } catch {
            return ""
        }
    }
}
