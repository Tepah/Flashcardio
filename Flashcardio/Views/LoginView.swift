//
//  LoginView.swift
//  Flashcardio
//
//  Created by Pete Potipitak on 11/22/23.
//
import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Username Text Field
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Password Secure Field
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Login") {
                    // Add your login logic here using the entered username and password
                    print("Email: \(email), Password: \(password)")
                }
                .padding()
                
                HStack {
                    Text("No account?")
                    NavigationLink(destination: SignUpView()){
                        Text("Sign up")
                    }
                }
            }
            .padding()
        }
    }
}

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            // Username Text Field
            TextField("Email", text: $email)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            // Password Secure Field
            SecureField("Password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Button("Sign up") {
                // Add your login logic here using the entered username and password
                print("Email: \(email), Password: \(password)")
            }
            .padding()
        }
    }
}


#Preview {
    LoginView()
}
