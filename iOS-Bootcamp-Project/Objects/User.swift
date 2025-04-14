//
//  User.swift
//  iOS-Bootcamp-Project
//
//  Created by Jason Wrzesien on 4/13/25.
//

import FirebaseCore
import FirebaseFirestore

class User: ObservableObject {
    static var shared = User(uid: "", name: "", email: "")
    
    @Published var uid: String
    @Published var name: String
    @Published var email: String
    
    init(uid: String, name: String, email: String) {
        self.uid = uid
        self.name = name
        self.email = email
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "uid": uid,
            "name": name,
            "email": email
        ]
    }
    
    func addUser() async -> String? {
        let db = Firestore.firestore()
        let docRef = toDictionary()
        do {
            let doc = db.collection("users").document(uid)
            try await doc.setData(docRef)
            print("Successfully added a user to the Firestore Database.")
            return uid
        } catch {
            print("Error adding user to Firestore database: \(error).")
        }
        return nil;
    }
    
    func getUser(uid: String) async -> User? {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid)
        do {
            let document = try await docRef.getDocument()
            if document.exists {
                let dataDescription = document.data()
                if let data = dataDescription {
                    let name: String = data["name"] as! String
                    let email: String = data["email"] as! String
                    return User(uid: uid, name: name, email: email)
                } else {
                    print("User's data in Firestore Database is nil.")
                }
            } else {
                print("User does not exist in the Firestore Database.")
            }
        } catch {
            print("Error getting user from the Firestore Database: \(error).")
        }
        return nil
    }
    
    
    func updateUser() async -> Bool {
        let data: [String: Any] = ["name": name, "email": email]
        do {
            let userDoc = Firestore.firestore().collection("users").document(uid)
            try await userDoc.updateData(data)
            print("User updated successfully")
            return true
        } catch {
            print("Error updating user: \(error)")
            return false
        }
    }
}
