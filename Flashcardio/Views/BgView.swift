//
//  HomeView.swift
//  Flashcardio
//
//  Created by Theresa Nguyen on 11/27/23.
//

import SwiftUI

struct BgView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: 0x2B4570), Color(hex:0x7180)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}


#Preview {
    BgView()
}
