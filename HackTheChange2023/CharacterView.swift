//
//  CharacterView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-12.
//

import SwiftUI

struct CharacterView: View {
    @AppStorage("Eyes") var myEyes: Eyes = .eyes1
    @AppStorage("Nose") var myNose: Nose = .nose1
    @AppStorage("Mouth") var myMouth: Mouth = .mouth1
    @AppStorage("Accessory") var myAccessory: Accessory = .none
    @AppStorage("Shirt") var myShirt: Shirt = .shirt2
    @AppStorage("Hair") var myHair: Hair = .hair2

    @AppStorage("BodyColor") var myBodyColor: Color = Color(.yellow)
    @AppStorage("AccesoryColor") var myAccessoryColor: Color = Color(.pink)
    @AppStorage("HairColor") var myHairColor: Color = Color(.brown)
    @AppStorage("ShirtColor") var myShirtColor: Color = Color(.blue)

    @State var eyes: Eyes
    @State var nose: Nose
    @State var mouth: Mouth
    @State var accessory: Accessory
    @State var shirt: Shirt
    @State var hair: Hair

    @State var bodyColor: Color
    @State var accessoryColor: Color
    @State var hairColor: Color
    @State var shirtColor: Color

    let isMe: Bool

    init() {
        self.eyes = .eyes1
        self.nose = .nose1
        self.mouth = .mouth1
        self.accessory = .accessory1
        self.shirt = .shirt1
        self.hair = .hair1
        self.bodyColor = .accent
        self.accessoryColor = .accent
        self.hairColor = .accent
        self.shirtColor = .accent
        self.isMe = true
    }

    init(
        eyes: Eyes,
        nose: Nose,
        mouth: Mouth,
        accessory: Accessory,
        shirt: Shirt,
        hair: Hair,
        bodyColor: Color = Color(.yellow),
        accessoryColor: Color = Color(.pink),
        hairColor: Color = Color(.brown),
        shirtColor: Color = Color(.blue)
    ) {
        self.eyes = eyes
        self.nose = nose
        self.mouth = mouth
        self.accessory = accessory
        self.shirt = shirt
        self.hair = hair
        self.bodyColor = bodyColor
        self.accessoryColor = accessoryColor
        self.hairColor = hairColor
        self.shirtColor = shirtColor
        self.isMe = false
    }


    var body: some View {
        ZStack {
            Image(.body)
                .foregroundStyle(self.isMe ? myBodyColor : bodyColor)
                .mask(Image(.body))

            Image(.bodyShadow)
                .background(self.isMe ? myBodyColor : bodyColor)
                .foregroundStyle(.black.opacity(0.2))
                .mask(Image(.bodyShadow))

            Image(.head)
                .foregroundStyle(self.isMe ? myBodyColor : bodyColor)

            Image(self.isMe ? myHair.imageName : hair.imageName)
                .foregroundStyle(self.isMe ? myHairColor: hairColor)

            Image(self.isMe ? myHair.accentImageName ?? "" : hair.accentImageName ?? "")
                .background(self.isMe ? myHairColor : hairColor)
                .foregroundStyle(.black.opacity(0.4))
                .mask(Image(self.isMe ? myHair.accentImageName ?? "" : hair.accentImageName ?? ""))

            Image(.ear)
                .foregroundStyle(self.isMe ? myBodyColor : bodyColor)

            Image(.earShadow)
                .background(self.isMe ? myBodyColor : bodyColor)
                .foregroundStyle(.black.opacity(0.2))
                .mask(Image(.earShadow))

            Image(self.isMe ? myNose.imageName : nose.imageName)
                .background(self.isMe ? myBodyColor : bodyColor)
                .foregroundStyle(.black.opacity(0.6))
                .mask(Image(self.isMe ? myNose.imageName : nose.imageName))

            Image(self.isMe ? myMouth.imageName : mouth.imageName)
                .background(self.isMe ? myBodyColor : bodyColor)
                .foregroundStyle(.black.opacity(0.6))
                .mask(Image(self.isMe ? myMouth.imageName : mouth.imageName))

            Image(self.isMe ? myEyes.imageName : eyes.imageName)
                .background(self.isMe ? myBodyColor : bodyColor)
                .foregroundStyle(.black.opacity(0.6))
                .mask(Image(self.isMe ? myEyes.imageName : eyes.imageName))

            Image(self.isMe ? myShirt.imageName : shirt.imageName)
                .foregroundStyle(self.isMe ? myShirtColor : shirtColor)

            Image(self.isMe ? myAccessory.imageName : accessory.imageName)
                .foregroundStyle(self.isMe ? myAccessoryColor : accessoryColor)

            Image(self.isMe ? myAccessory.accentImageName ?? "" : accessory.accentImageName ?? "")
                .background(self.isMe ? myAccessoryColor : accessoryColor)
                .foregroundStyle(.black.opacity(0.5))
                .mask(Image(self.isMe ? myAccessory.accentImageName ?? "" : accessory.accentImageName ?? ""))
        }
    }
}

enum Accessory: String, Identifiable, CaseIterable {
    var id: Self { self }

    case none = ""
    case accessory1 = "Accessory 1"
    case accessory2 = "Accessory 2"

    var imageName: String {
        self.rawValue
    }

    var accentImageName: String? {
        if self == .accessory2 {
            return "Accessory 2 Lenses"
        }
        return nil
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
