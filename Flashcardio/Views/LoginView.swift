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
    @State private var showErrorModal: Bool = false
    @State private var authenticationFailed = false
    
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
            .alert(isPresented: $showErrorModal) {
                Alert(
                    title: Text("Account not found"),
                    message: Text("Please put in a valid account"),
                    dismissButton: .default(Text("OK")))
            }
        }
    }
    
    
    func loginLogic(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("Login failed: \(error.localizedDescription)")
                showErrorModal = true
            } else {
                print("Login successful!")
            }
        }
    }
}

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showErrorModal: Bool = false
    @State private var errorMessage: String = "Default Error"
    
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
                let specialCharacters = CharacterSet(charactersIn: "!@#$%^&*()_-+=[]{}|:;<>,.?/~`")
                if !isValidEmail(email: email) {
                    showErrorModal = true
                    errorMessage = "Not a valid email."
                } else if password.count < 8 {
                    showErrorModal = true
                    errorMessage = "The password is less than 8 characters."
                } else {
                    signUpLogic(email:email, password:password)
                }
            }
            .padding()
        }
        .alert(isPresented: $showErrorModal) {
            Alert(
                title: Text("Account not created"),
                message: Text(errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

func isValidEmail(email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}

func signUpLogic(email: String, password: String) {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          print("\(email) created")
    }
}




#Preview {
    LoginView()
}
