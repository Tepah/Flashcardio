//
//  Firestore.swift
//  Flashcardio
//
//  Created by Pete Potipitak on 12/9/23.
//

import Firebase
import FirebaseFirestoreSwift

struct deck: Identifiable, Codable {
    @DocumentID var id: String?
    var UserID: String
    var Title: String
    var Questions: [String]
    var Answers: [String]
}

class MyDataViewModel: ObservableObject {
    @Published var myDataList: [deck] = []

    // Function to load data from Firestore for a specific userId
    func loadData(forUserId userId: String) {
        print("Getting decks for \(userId)")
        let collectionRef = Firestore.firestore().collection("Decks")
        
        collectionRef
            .whereField("UserID", isEqualTo: userId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error fetching documents: \(error.localizedDescription)")
                    return
                }
                print("Documents: \(querySnapshot?.documents ?? [])")

                self.myDataList = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: deck.self)
                } ?? []
            }
    }
}

func getAllUserDecks(userId: String) {
    let db = Firestore.firestore()
    db.collection("Decks").whereField("UserID", isEqualTo: userId)
      .getDocuments() { (querySnapshot, err) in
        if let err = err {
          print("Error getting documents: \(err)")
        } else {
          for document in querySnapshot!.documents {
            print("\(document.documentID) => \(document.data())")
          }
        }
      }
}

func getDocumentsForUserId(userId: String, collectionName: String, completion: @escaping ([QueryDocumentSnapshot]?, Error?) -> Void) {
    let db = Firestore.firestore()

    // Create a query to filter documents by userId
    let query = db.collection(collectionName).whereField("UserID", isEqualTo: userId)

    // Execute the query
    query.getDocuments { (querySnapshot, error) in
        if let error = error {
            // Handle the error
            completion(nil, error)
        } else {
            // Documents retrieved successfully
            let documents = querySnapshot?.documents ?? []
            completion(documents, nil)
        }
    }
}

func getDeckData(deckID: String, title: String, completion: @escaping (Result<[String: Any], Error>) -> Void)  {
    let db = Firestore.firestore()
    
    let ref = db.collection("Decks").document(deckID)
    ref.getDocument { (documentSnapshot, error) in
       if let error = error {
           // Handle the error if any
           completion(.failure(error))
           return
       }

       guard let document = documentSnapshot else {
           // Document doesn't exist
           completion(.failure(NSError(domain: "Flashcardio", code: 404, userInfo: nil)))
           return
       }

       if document.exists {
           if let data = document.data() {
               // Document data retrieved successfully
               completion(.success(data))
           } else {
               // Document doesn't contain any data
               completion(.failure(NSError(domain: "Flashcardio", code: 500, userInfo: nil)))
           }
       } else {
           // Document doesn't exist
           completion(.failure(NSError(domain: "Flashcardio", code: 404, userInfo: nil)))
       }
   }
}

func updateDeck(deckID: String, updatedDeck: [AnyHashable: Any]) {
    let ref = Firestore.firestore().collection("Decks").document(deckID)
    ref.updateData(updatedDeck) { error in
        if let error = error {
            print("Error updating document: \(error.localizedDescription)")
        } else {
            print("Document updated successfully!")
        }
    }
}

func getUserId() -> String {
    if let user = Auth.auth().currentUser {
        // User is signed in.
        let uid = user.uid
        print("User ID: \(uid)")
        return uid
    } else {
        // No user is signed in.
        print("No user signed in.")
        return ""
    }
}

func deleteDeck(deckID: String) {
    let db = Firestore.firestore()
    let collectionRef = db.collection("Decks").document(deckID)
    collectionRef.delete { error in
        if let error = error {
            print("Error deleting deck: \(error.localizedDescription)")
        } else {
            print("Deck deleted successfully")
        }
    }
}
