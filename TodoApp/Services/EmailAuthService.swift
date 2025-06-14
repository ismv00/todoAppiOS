//
//  EmailAuthService.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 14/06/25.
//

import Foundation

import FirebaseAuth

struct EmailAuthService {
    static func signIn(email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        print("Usuário logado: \(result.user.email ?? "sem e-mail")")
    }
}
