//
//  LoginView.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 05/05/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    
    var body: some View {
        
        NavigationStack {

        VStack(spacing: 20) {
            Spacer()
            
            
            Text("Bem vindo de volta!")
                .font(.largeTitle).bold()
                .foregroundStyle(.black)
            Text("Vamos te ajudar a concluir suas tarefas")
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.7))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Image("login")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(.bottom, 20)
            
            TextField("Digite seu e-mail", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField("Digite sua senha", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                           print("Esqueceu a senha")
                       }) {
                           Text("Esqueceu sua senha?")
                               .foregroundColor(Color.customAccentColor)
                               .padding(.bottom, 10)
                       }
            NavigationLink(destination: TodoView()) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customAccentColor)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            //Login com google e Apple ID
            HStack(spacing: 20) {
                Button(action: {
                    Task {
                        do {
                            try await GoogleAuthService.signInWithGoogle()
                            print("Usuário autenticado com Google")
                        } catch {
                            print("Erro ao autenticar com Google: \(error.localizedDescription)")
                        }
                    }
                }) {
                    Image("google-logo")
                        .resizable()
                        .frame(width: 150, height: 50)
                        .font(.title2)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }
                
            }
            .padding(.bottom, 20)
            
            HStack {
                Text("Não tem uma conta?")
                NavigationLink(destination: RegisterView()) {
                    Text("Signup")
                        .foregroundStyle(Color.customAccentColor)
                }
            }
            .padding(.bottom, 30)
            
            Spacer()
        }
        .background(Color.customBackgroundColor.ignoresSafeArea())
            
            
        }
    }
}

#Preview {
    LoginView()
}
