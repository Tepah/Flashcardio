//
//  SettingsView.swift
//  Flashcardio
//
//  Created by Justin Nguyen on 12/9/23.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    //@EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Settings")
                    .font(.title)
                    .padding(.vertical, 30)
                DefinitionFirstSwitch()
                    .padding(.vertical, 10)
                ShuffleButton()
                    .padding(.vertical, 10)
                HStack {
                    Button(action: {
                        logoutLogic()
                    }) {
                        Text("Logout")
                            .bold()
                    }
                    .padding()
                    .background(Color.red)               .foregroundColor(.white)
                    .cornerRadius(10)
                    .bold()
                }
                .padding(10)
                Spacer()
            }
            .background(Color(hex: 0x7399a4))
            /*Form {
             Section(header: Text("Text Settings")) {
             Stepper("Font Size: \(Int(appSettings.fontSize))", value: $appSettings.fontSize, in: 12...24)
             ColorPicker("Text Color", selection: $appSettings.textColor)
             }
             }*/
        }
    }
    
    func logoutLogic() {
        do {
            try Auth.auth().signOut()
            print("Logged out successfully.")
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
    }
}

struct DefinitionFirstSwitch: View {
    @State private var isSwitchOn: Bool = isDefinitionFirst
    
    var body: some View {
        HStack {
            Toggle("Definition First", isOn: $isSwitchOn)
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
                .font(.title2)
                .onChange(of: isSwitchOn) { newValue in
                    isDefinitionFirst = newValue
                }
        }
        
    }
}

struct ShuffleButton: View {
    @State private var isSwitchOn: Bool = isShuffleOn
    
    var body: some View {
        HStack {
            Toggle("Shuffle deck", isOn: $isSwitchOn)
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
                .font(.title2)
        }
        .onChange(of: isSwitchOn) { newValue in
                    isShuffleOn = newValue
                }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
