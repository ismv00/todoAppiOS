//
//  GoogleAuthService.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 18/05/25.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import UIKit

class GoogleAuthService {
    static func signInWithGoogle() async throws {
        guard
            let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let rootViewController = await windowScene.windows.first?.rootViewController
        else {
            throw NSError(domain: "AppError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No root view controller"])
        }

        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)

        print("Usuário autenticado: \(result.user.profile?.email ?? "sem email")")
    }
}
