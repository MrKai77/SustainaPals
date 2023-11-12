//
//  ProfileView.swift
//  HackTheChange2023
//
//  Created by Kai Azim on 2023-11-11.
//

import SwiftUI

struct ProfileView: View {
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

    var tabs = ["Customize", "Achievements"]
    @State var currentTab = "Achievements"

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color(.sustainableGreen))
                .ignoresSafeArea()

            VStack {
                Picker("", selection: $currentTab) {
                    ForEach(tabs, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 20)

                Rectangle()
                    .foregroundStyle(.sustainableBrown.opacity(0.5))
                    .overlay {
                        CharacterView()
                            .scaleEffect(0.4)
                    }

                    .overlay {
                        Circle()
                            .strokeBorder(.sustainableBrown, lineWidth: 5)
                    }
                    .clipShape(.circle)
                    .shadow(color: .black.opacity(0.2), radius: 20)

                    .padding(20)

                if currentTab == "Achievements" {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 400)
                        .foregroundStyle(.sustainableBrown.opacity(0.5))
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(.sustainableBrown, lineWidth: 5)
                        }
                        .shadow(color: .black.opacity(0.2), radius: 20)
                        .overlay {
                            VStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 80)
                                    .foregroundStyle(.sustainableBrown.opacity(0.5))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(.sustainableBrown, lineWidth: 5)
                                    }
                                    .overlay {
                                        HStack {
                                            Image("The Path to Sustainable Life")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding(15)

                                            VStack(alignment: .leading) {
                                                Text("The Path to Sustainable Life")
                                                    .font(.headline)
                                                Text("Complete your first lesson.")
                                                    .font(.caption)
                                            }
                                            Spacer()
                                        }
                                    }

                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 80)
                                    .foregroundStyle(.sustainableBrown.opacity(0.5))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(.sustainableBrown, lineWidth: 5)
                                    }
                                    .overlay {
                                        HStack {
                                            Image("Express Yourself")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding(15)

                                            VStack(alignment: .leading) {
                                                Text("Express Yourself")
                                                    .font(.headline)
                                                Text("Customize your SustainaPal!")
                                                    .font(.caption)
                                            }
                                            Spacer()
                                        }
                                    }

                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 80)
                                    .foregroundStyle(.sustainableBrown.opacity(0.5))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(.sustainableBrown, lineWidth: 5)
                                    }
                                    .overlay {
                                        HStack {
                                            Image("Practice Makes Perfect")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding(15)

                                            VStack(alignment: .leading) {
                                                Text("Practice Makes Perfect")
                                                    .font(.headline)
                                                Text("Complete a lesson or boss fight after failing twice.")
                                                    .font(.caption)
                                            }
                                            Spacer()
                                        }
                                    }

                                Spacer()
                            }
                            .padding(10)
                            .foregroundStyle(.sustainableWhite)
                        }
                        .padding(20)
                } else {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 400)
                        .foregroundStyle(.sustainableBrown.opacity(0.5))
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(.sustainableBrown, lineWidth: 5)
                        }
                        .shadow(color: .black.opacity(0.2), radius: 20)
                        .overlay {
                            VStack {
                                HStack {
                                    Text("Mouth:")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(.sustainableBrown.opacity(0.5))
                                        .clipShape(.rect(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .strokeBorder(.sustainableBrown, lineWidth: 5)
                                        }
                                        .fixedSize()

                                    ForEach(Mouth.allCases) { item in
                                        Button(action: {
                                            self.mouth = item
                                        }, label: {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(height: 45)
                                                .foregroundStyle(.sustainableBrown.opacity(0.5))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .strokeBorder(.sustainableBrown, lineWidth: 5)
                                                }

                                                .overlay {
                                                    Image(item.imageName)
                                                        .scaleEffect(0.4)
                                                        .offset(x: -10, y: -15)
                                                }
                                        })
                                    }
                                }

                                HStack {
                                    Text("Eyes:")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(.sustainableBrown.opacity(0.5))
                                        .clipShape(.rect(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .strokeBorder(.sustainableBrown, lineWidth: 5)
                                        }
                                        .fixedSize()

                                    ForEach(Eyes.allCases) { item in
                                        Button(action: {
                                            self.eyes = item
                                        }, label: {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(height: 45)
                                                .foregroundStyle(.sustainableBrown.opacity(0.5))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .strokeBorder(.sustainableBrown, lineWidth: 5)
                                                }

                                                .overlay {
                                                    Image(item.imageName)
                                                        .scaleEffect(0.4)
                                                        .offset(x: -18, y: 13)
                                                }

                                        })
                                    }
                                }

                                HStack {
                                    Text("Nose:")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding(10)
                                        .background(.sustainableBrown.opacity(0.5))
                                        .clipShape(.rect(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .strokeBorder(.sustainableBrown, lineWidth: 5)
                                        }
                                        .fixedSize()

                                    ForEach(Nose.allCases) { item in
                                        Button(action: {
                                            self.nose = item
                                        }, label: {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(height: 45)
                                                .foregroundStyle(.sustainableBrown.opacity(0.5))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .strokeBorder(.sustainableBrown, lineWidth: 5)
                                                }

                                                .overlay {
                                                    Image(item.imageName)
                                                        .scaleEffect(0.4)
                                                        .offset(x: -20)
                                                }
                                        })
                                    }
                                }

                                HStack {
                                    HStack {
                                        ColorPicker("", selection: $hairColor, supportsOpacity: false)
                                        Text("Hair:")
                                    }
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(10)
                                    .background(.sustainableBrown.opacity(0.5))
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(.sustainableBrown, lineWidth: 5)
                                    }
                                    .fixedSize()

                                    ForEach(Hair.allCases) { item in
                                        Button(action: {
                                            self.hair = item
                                        }, label: {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(height: 45)
                                                .foregroundStyle(.sustainableBrown.opacity(0.5))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .strokeBorder(.sustainableBrown, lineWidth: 5)
                                                }

                                                .overlay {
                                                    Image(item.imageName)
                                                        .scaleEffect(0.07)
                                                }
                                        })
                                    }
                                }

                                HStack {
                                    HStack {
                                        ColorPicker("", selection: $shirtColor, supportsOpacity: false)
                                        Text("Shirt:")
                                    }
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(10)
                                    .background(.sustainableBrown.opacity(0.5))
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(.sustainableBrown, lineWidth: 5)
                                    }
                                    .fixedSize()

                                    ForEach(Shirt.allCases) { item in
                                        Button(action: {
                                            self.shirt = item
                                        }, label: {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(height: 45)
                                                .foregroundStyle(.sustainableBrown.opacity(0.5))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .strokeBorder(.sustainableBrown, lineWidth: 5)
                                                }

                                                .overlay {
                                                    Image(item.imageName)
                                                        .scaleEffect(0.1)
                                                        .offset(y: -20)
                                                }
                                        })
                                    }
                                }

                                HStack {
                                    HStack {
                                        ColorPicker("", selection: $accessoryColor, supportsOpacity: false)
                                        Text("Accessory:")
                                    }
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(10)
                                    .background(.sustainableBrown.opacity(0.5))
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(.sustainableBrown, lineWidth: 5)
                                    }
                                    .fixedSize()

                                    ForEach(Accessory.allCases) { item in
                                        Button(action: {
                                            self.accessory = item
                                        }, label: {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(height: 45)
                                                .foregroundStyle(.sustainableBrown.opacity(0.5))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .strokeBorder(.sustainableBrown, lineWidth: 5)
                                                }

                                                .overlay {
                                                    Image(item.imageName)
                                                        .scaleEffect(0.12)
                                                        .offset(y: item == .accessory2 ? 20 : -5)
                                                }
                                        })
                                    }
                                }

                                HStack {
                                    Text("Skin Color:")
                                    Spacer()
                                    ColorPicker("", selection: $bodyColor, supportsOpacity: false)
                                }
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(10)
                                .background(.sustainableBrown.opacity(0.5))
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(.sustainableBrown, lineWidth: 5)
                                }
                            }
                            .padding(10)
                            .foregroundStyle(.sustainableWhite)
                        }
                        .padding(20)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
