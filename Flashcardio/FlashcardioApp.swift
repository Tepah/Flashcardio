//
//  FlashcardioApp.swift
//  Flashcardio
//
//  Created by Pete Potipitak on 11/20/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

// Globals
var isDefinitionFirst = false
var isShuffleOn = false


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Auth.auth().addStateDidChangeListener { (auth, user) in
                    if let user = user {
                        // User is signed in
                        print("User is signed in with UID: \(user.uid)")
                    } else {
                        // User is signed out
                        print("User is signed out")
                    }
                }
        return true
    }
}

@main
struct FlashcardioApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authManager = AuthManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                            .environmentObject(authManager)
        }
    }
}

class AuthManager: ObservableObject {

    @Published var isUserAuthenticated = false

    init() {
        // Add authentication state change observer
        Auth.auth().addStateDidChangeListener { (_, user) in
            self.isUserAuthenticated = (user != nil)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        Group {
            if authManager.isUserAuthenticated {
                // Your main content when the user is signed in
                Main()
            } else {
                // Show LoginView when the user is signed out
                LoginView()
            }
        }
    }
}
