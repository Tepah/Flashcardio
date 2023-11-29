//
//  LoginView.swift
//  Flashcardio
//
//  Created by Pete Potipitak on 11/22/23.
//
import SwiftUI
import FirebaseAuth

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
                    loginLogic(email: email, password: password)
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
                signUpLogic(email:email, password:password)
            }
            .padding()
        }
    }
}

func signUpLogic(email: String, password: String) {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          print("\(email) created")
    }
}

func loginLogic(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
        if let error = error {
            print("Login failed: \(error.localizedDescription)")
        } else {
            print("Login successful!")
            // Handle successful login, e.g., navigate to another screen
        }
    }
}



#Preview {
    LoginView()
}
