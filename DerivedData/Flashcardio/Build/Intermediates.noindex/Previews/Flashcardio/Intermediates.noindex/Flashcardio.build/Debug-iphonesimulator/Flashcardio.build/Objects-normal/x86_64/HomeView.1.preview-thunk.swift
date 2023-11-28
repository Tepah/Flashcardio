@_private(sourceFile: "HomeView.swift") import Flashcardio
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension FlashcardSetView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/HomeView.swift", line: 56)
        Text("Flashcard Set: \(setTitle)")
    
#sourceLocation()
    }
}

extension FlashcardSetListView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/HomeView.swift", line: 39)
        NavigationView {
            List {
                ForEach(flashcardSets, id: \.self) { setTitle in
                    NavigationLink(destination: FlashcardSetView(setTitle: setTitle)) {
                        Text(setTitle)
                    }
                }
            }
        }
        .navigationTitle(__designTimeString("#7678.[2].[2].property.[0].[0].modifier[0].arg[0].value", fallback: "Flashcard Sets"))
    
#sourceLocation()
    }
}

extension HomeView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/HomeView.swift", line: 12)
        Text(__designTimeString("#7678.[1].[0].property.[0].[0].arg[0].value", fallback: "Flashcardio"))
            .font(.title)
            .bold()
            
        NavigationView {
            VStack {
                TabView{
                    FlashcardSetListView()
                        .tabItem{
                            Label(__designTimeString("#7678.[1].[0].property.[0].[1].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value", fallback: "Flashcard Sets"), systemImage:__designTimeString("#7678.[1].[0].property.[0].[1].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[1].value", fallback: "list.dash.header.rectangle"))
                        }
                    Text(__designTimeString("#7678.[1].[0].property.[0].[1].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "settings"))
                        .tabItem{
                            Label(__designTimeString("#7678.[1].[0].property.[0].[1].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value.[0].arg[0].value", fallback: "Profile"), systemImage:__designTimeString("#7678.[1].[0].property.[0].[1].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value.[0].arg[1].value", fallback: "person.circle"))
                        }
                }
            }
        }
    
#sourceLocation()
    }
}

import struct Flashcardio.HomeView
import struct Flashcardio.FlashcardSetListView
import struct Flashcardio.FlashcardSetView
#Preview {
    HomeView()
}



