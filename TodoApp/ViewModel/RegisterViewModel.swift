//
//  RegisterViewModel.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 15/06/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class RegisterViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
        
    @Published var isLoading = false
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var registrationComplete = false
    
    func registerUser() async {
        guard validateFields() else { return }
        
        isLoading = true
        
        do {
            // Criar o usuário
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let uid = result.user.uid
            
            let user = UserModel(id: uid, fullName: fullName, email: email, createdAt: Date())
            
            try await Firestore.firestore()
                .collection("users")
                .document(uid)
                .setData(user.asDictionary)
            
            DispatchQueue.main.async {
                self.registrationComplete = true
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.showError = true
            }
        }
        
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
    
    func validateFields() -> Bool {
        guard !fullName.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "Preencha todos os campos"
            showError = true
            return false
            
        }
        
        guard password == confirmPassword else {
            errorMessage = "As senhas não coincidem"
            showError = true
            return false
        }
        
        return true
    }
    
}
