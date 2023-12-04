@_private(sourceFile: "Main.swift") import Flashcardio
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension TempView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Main.swift", line: 103)
        VStack {
            Text(__designTimeString("#4670.[5].[0].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Nothing to see here.."))
        }
    
#sourceLocation()
    }
}

extension AddCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Main.swift", line: 83)
        NavigationLink(destination: TempView()) {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: __designTimeInteger("#4670.[4].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: 8))
                    .fill(Color(hex: __designTimeInteger("#4670.[4].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[0].arg[0].value.arg[0].value", fallback: 0x565656)))
                    .frame(width: __designTimeInteger("#4670.[4].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 265), height: __designTimeInteger("#4670.[4].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: 110))
                    .opacity(__designTimeFloat("#4670.[4].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: 0.7))
                    .overlay(
                        Text(__designTimeString("#4670.[4].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[3].arg[0].value.arg[0].value", fallback: "+"))
                            .foregroundColor(.white)
                            .font(.title)
                    )
                Spacer()
            }
        }
    
#sourceLocation()
    }
}

extension FlashCardSet {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Main.swift", line: 55)
        NavigationLink(destination: TempView()) {
            ZStack {
                RoundedRectangle(cornerRadius: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: 12))
                    .fill(Color(hex: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 0x565656)))
                    .frame(width: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 310), height: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: 130))
                    .opacity(__designTimeFloat("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 0.6))
                    .offset(y: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[3].arg[0].value", fallback: 30))
                RoundedRectangle(cornerRadius: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: 10))
                    .fill(Color(hex: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[0].arg[0].value.arg[0].value", fallback: 0x565656)))
                    .frame(width: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 325), height: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: 140))
                    .opacity(__designTimeFloat("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: 0.7))
                    .offset(y: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[3].arg[0].value", fallback: 15))
                RoundedRectangle(cornerRadius: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value", fallback: 8))
                    .fill(Color(hex: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[0].arg[0].value.arg[0].value", fallback: 0x565656)))
                    .frame(width: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 340), height: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[1].arg[1].value", fallback: 160))
                    .overlay(
                        Text(title)
                            .foregroundColor(.white)
                            .font(.title)
                    )
                    .offset(x: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[3].arg[0].value", fallback: 0), y: __designTimeInteger("#4670.[3].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[3].arg[1].value", fallback: 0))
            }
        }
    
#sourceLocation()
    }
}

extension Main {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Main.swift", line: 24)
        NavigationView {
            VStack {
                // Put cards per card on account here !!!right now placeholder
                List {
                    GeometryReader { geometry in
                                        Text(__designTimeString("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "Flashcardio"))
                                            .font(.largeTitle) // Set your desired font size here
                                            .frame(width: geometry.size.width, height: __designTimeInteger("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: 0))
                                            .foregroundColor(Color.white)
                                    }
                    .listRowBackground(Color(hex: __designTimeInteger("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 0x2E3A31)))
                    .padding(.vertical, __designTimeInteger("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: 10))
                    FlashCardSet(title: __designTimeString("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "tempoary name 1")).listRowBackground(Color(hex: __designTimeInteger("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value.arg[0].value", fallback: 0x2E3A31)))
                    FlashCardSet(title: __designTimeString("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].arg[0].value", fallback: "tempoary name 2")).listRowBackground(Color(hex: __designTimeInteger("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].modifier[0].arg[0].value.arg[0].value", fallback: 0x2E3A31)))
                    FlashCardSet(title: __designTimeString("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[3].arg[0].value", fallback: "tempoary name 3")).listRowBackground(Color(hex: __designTimeInteger("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[3].modifier[0].arg[0].value.arg[0].value", fallback: 0x2E3A31)))
                    FlashCardSet(title: __designTimeString("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[4].arg[0].value", fallback: "tempoary name 4")).listRowBackground(Color(hex: __designTimeInteger("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[4].modifier[0].arg[0].value.arg[0].value", fallback: 0x2E3A31)))
                    // Add card button
                    AddCard().listRowBackground(Color(hex: __designTimeInteger("#4670.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[5].modifier[0].arg[0].value.arg[0].value", fallback: 0x2E3A31))).contentShape(Rectangle())
                }
                .listStyle(PlainListStyle())
            }
            .background(Color(hex: __designTimeInteger("#4670.[2].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 0x2E3A31)))
        }
    
#sourceLocation()
    }
}

import struct Flashcardio.Main
import struct Flashcardio.FlashCardSet
import struct Flashcardio.AddCard
import struct Flashcardio.TempView
#Preview {
    Main()
}



