//
//  UserModel.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 15/06/25.
//

import Foundation
import FirebaseCore

struct UserModel: Identifiable, Codable {
    var id : String
    var fullName: String
    var email: String
    var createdAt: Date
    
    var asDictionary: [String: Any] {
        return [
            "fullName" : fullName,
            "email" : email,
            "createdAt" : Timestamp(date: createdAt)
        ]
    }
}
