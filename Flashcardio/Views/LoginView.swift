//
//  LoginView.swift
//  Flashcardio
//
//  Created by Pete Potipitak on 11/22/23.
//
import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            // Username Text Field
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Password Secure Field
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Login") {
                // Add your login logic here using the entered username and password
                print("Username: \(username), Password: \(password)")
            }
            .padding()
        }
        .padding()
    }
}


#Preview {
    LoginView()
}
