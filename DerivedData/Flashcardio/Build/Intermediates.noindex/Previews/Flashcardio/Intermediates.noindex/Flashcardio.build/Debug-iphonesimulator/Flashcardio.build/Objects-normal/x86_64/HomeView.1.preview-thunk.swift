@_private(sourceFile: "HomeView.swift") import Flashcardio
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension BgView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/simonscolars/Desktop/Flashcardio/Flashcardio/HomeView.swift", line: 12)
        ZStack {
            LinearGradient(colors: [Color(hex: __designTimeInteger("#4589.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: 0x2B4570)), Color(hex:__designTimeInteger("#4589.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: 0xA8D0DB))], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    
#sourceLocation()
    }
}

import struct Flashcardio.BgView
#Preview {
    BgView()
}



