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
            HStack {
                Button(action: {
                    logoutLogic()
                }) {
                    Text("Logout")
                        .foregroundColor(.red)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.red, lineWidth: 1))
                }
            }
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
