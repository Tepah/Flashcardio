@_private(sourceFile: "Main.swift") import Flashcardio
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import FirebaseFirestore
import FirebaseAuth
import Firebase
import SwiftUI

extension TempView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 144)
        VStack {
            Text(__designTimeString("#580.[9].[0].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Nothing to see here.."))
        }
    
#sourceLocation()
    }
}

extension AddCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 124)
        NavigationLink(destination: CreateSetView()) {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: __designTimeInteger("#580.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: 8))
                    .fill(Color(hex: __designTimeInteger("#580.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[0].arg[0].value.arg[0].value", fallback: 0x7399a4)))
                    .frame(width: __designTimeInteger("#580.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 265), height: __designTimeInteger("#580.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: 110))
                    .opacity(__designTimeFloat("#580.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: 0.7))
                    .overlay(
                        Text(__designTimeString("#580.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[3].arg[0].value.arg[0].value", fallback: "+"))
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
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 96)
        NavigationLink(destination: CardsView(deckID: deckID, title: title)) {
            ZStack {
                RoundedRectangle(cornerRadius: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: 12))
                    .fill(Color(hex: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 0x7399a4)))
                    .frame(width: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 310), height: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: 130))
                    .opacity(__designTimeFloat("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 0.6))
                    .offset(y: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[3].arg[0].value", fallback: 30))
                RoundedRectangle(cornerRadius: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: 10))
                    .fill(Color(hex: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[0].arg[0].value.arg[0].value", fallback: 0x7399a4)))
                    .frame(width: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 325), height: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: 140))
                    .opacity(__designTimeFloat("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: 0.7))
                    .offset(y: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[3].arg[0].value", fallback: 15))
                RoundedRectangle(cornerRadius: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value", fallback: 8))
                    .fill(Color(hex: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[0].arg[0].value.arg[0].value", fallback: 0x7399a4)))
                    .frame(width: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 340), height: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[1].arg[1].value", fallback: 160))
                    .overlay(
                        Text(title)
                            .foregroundColor(.white)
                            .font(.title)
                    )
                    .offset(x: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[3].arg[0].value", fallback: 0), y: __designTimeInteger("#580.[7].[2].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[3].arg[1].value", fallback: 0))
            }
        }
    
#sourceLocation()
    }
}

extension ShowUsersDecks {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 78)
        List(decks.myDataList) { deck in
            FlashCardSet(title: deck.Title, deckID: deck.id!)
            .listRowBackground(Color.clear)
        }
        .background(Color.clear)
        .listStyle(PlainListStyle())
        .onAppear {
            decks.loadData(forUserId: getUserId())
        }
    
#sourceLocation()
    }
}

extension Main {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 29)
        NavigationView {
            BgView()
                .overlay(
            VStack {
                HStack{
                    Spacer()
                    Button(action: {
                        self.showSettingsScreen = __designTimeBoolean("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].[0]", fallback: true)
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: __designTimeInteger("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 20), height: __designTimeInteger("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 3))
                                .foregroundColor(.white)
                                .offset(y: __designTimeInteger("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: -6))
                            
                            Rectangle()
                                .frame(width: __designTimeInteger("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 20), height: __designTimeInteger("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 3))
                                .foregroundColor(.white)
                            
                            Rectangle()
                                .frame(width: __designTimeInteger("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.[2].modifier[0].arg[0].value", fallback: 20), height: __designTimeInteger("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.[2].modifier[0].arg[1].value", fallback: 3))
                                .foregroundColor(.white)
                                .offset(y: __designTimeInteger("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.[2].modifier[2].arg[0].value", fallback: 6))
                        }
                        .padding()
                    }
                }
                .padding(.vertical, __designTimeInteger("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].modifier[0].arg[1].value", fallback: 10))
                Text(__designTimeString("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[1].arg[0].value", fallback: "Flashcardio"))
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                ShowUsersDecks()
                // Add card button
                AddCard().listRowBackground(Color(hex: __designTimeInteger("#580.[5].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[3].modifier[0].arg[0].value.arg[0].value", fallback: 0x2e3a31))).contentShape(Rectangle())
            }
            .sheet(isPresented: $showSettingsScreen) {
                SettingsView()
            })
        }
    
#sourceLocation()
    }
}

import struct Flashcardio.Main
import struct Flashcardio.ShowUsersDecks
import struct Flashcardio.FlashCardSet
import struct Flashcardio.AddCard
import struct Flashcardio.TempView
#Preview {
    Main()
}



