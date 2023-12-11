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

@_dynamicReplacement(for: logoutLogic()) private func __preview__logoutLogic() {
#sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 129)
    do {
        try Auth.auth().signOut()
        print("Logged out successfully.")
    } catch let signOutError as NSError {
        print("Error signing out: \(signOutError.localizedDescription)")
    }

#sourceLocation()
}

extension TempView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 122)
        VStack {
            Text(__designTimeString("#15290.[9].[0].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Nothing to see here.."))
        }
    
#sourceLocation()
    }
}

extension AddCard {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 102)
        NavigationLink(destination: CreateSetView()) {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: __designTimeInteger("#15290.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: 8))
                    .fill(Color(hex: __designTimeInteger("#15290.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[0].arg[0].value.arg[0].value", fallback: 0x565656)))
                    .frame(width: __designTimeInteger("#15290.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 265), height: __designTimeInteger("#15290.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: 110))
                    .opacity(__designTimeFloat("#15290.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: 0.7))
                    .overlay(
                        Text(__designTimeString("#15290.[8].[0].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[3].arg[0].value.arg[0].value", fallback: "+"))
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
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 74)
        NavigationLink(destination: TempView()) {
            ZStack {
                RoundedRectangle(cornerRadius: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: 12))
                    .fill(Color(hex: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 0x565656)))
                    .frame(width: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 310), height: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: 130))
                    .opacity(__designTimeFloat("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 0.6))
                    .offset(y: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[0].modifier[3].arg[0].value", fallback: 30))
                RoundedRectangle(cornerRadius: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: 10))
                    .fill(Color(hex: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[0].arg[0].value.arg[0].value", fallback: 0x565656)))
                    .frame(width: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 325), height: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: 140))
                    .opacity(__designTimeFloat("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: 0.7))
                    .offset(y: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].modifier[3].arg[0].value", fallback: 15))
                RoundedRectangle(cornerRadius: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].arg[0].value", fallback: 8))
                    .fill(Color(hex: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[0].arg[0].value.arg[0].value", fallback: 0x565656)))
                    .frame(width: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 340), height: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[1].arg[1].value", fallback: 160))
                    .overlay(
                        Text(title)
                            .foregroundColor(.white)
                            .font(.title)
                    )
                    .offset(x: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[3].arg[0].value", fallback: 0), y: __designTimeInteger("#15290.[7].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[2].modifier[3].arg[1].value", fallback: 0))
            }
        }
    
#sourceLocation()
    }
}

extension ShowUsersDecks {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 57)
        VStack {
            List(decks.myDataList) { deck in
                FlashCardSet(title:  deck.Title).listRowBackground(Color(hex: __designTimeInteger("#15290.[6].[1].property.[0].[0].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 0x2E3A31)))
            }
            .listStyle(PlainListStyle())
        }
        .onAppear {
            decks.loadData(forUserId: getUserId())
        }
    
#sourceLocation()
    }
}

extension Main {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/Views/Main.swift", line: 27)
        NavigationView {
            BgView()
                .overlay(
            VStack {
                GeometryReader { geometry in
                                    Text(__designTimeString("#15290.[5].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "Flashcardio"))
                                        .font(.largeTitle) // Set your desired font size here
                                        .frame(width: geometry.size.width, height: __designTimeInteger("#15290.[5].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].arg[0].value.[0].modifier[1].arg[1].value", fallback: 20))
                                        .foregroundColor(Color.white)
                                        .bold()
                                }
                //.listRowBackground(Color(hex: 0x2E3A31))
                .padding(.vertical, __designTimeInteger("#15290.[5].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[0].modifier[0].arg[1].value", fallback: 10))
                ShowUsersDecks()
                // Add card button
                AddCard().listRowBackground(Color(hex: __designTimeInteger("#15290.[5].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[2].modifier[0].arg[0].value.arg[0].value", fallback: 0x2e3a31))).contentShape(Rectangle())
                // Temporary log out button lol
                Button(__designTimeString("#15290.[5].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value.[3].arg[0].value", fallback: "Logout")) {
                    logoutLogic()
                }
            })
            //.background(Color(hex: 0x2E3A31))
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



