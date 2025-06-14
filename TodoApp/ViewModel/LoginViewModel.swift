//
//  LoginViewModel.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 14/06/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published  var email = ""
    @Published  var password = ""
    @Published  var isLoading = false
    @Published  var showError = false
    @Published  var errorMessage = ""
    @Published  var isLoggedIn = false
    
    @MainActor
    func signInUser() async {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Preencha seu e-mail e senha."
            showError = true
            return
        }
        
        isLoading = true
        
        do {
            try await EmailAuthService.signIn(email: email, password: password)
            isLoggedIn = true
        } catch {
            errorMessage = error.localizedDescription
            showError = true
        }
        isLoading = false
    }
    
    
}
