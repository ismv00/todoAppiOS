//
//  LoginView.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 05/05/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    
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
            
            TextField("Digite seu e-mail", text: $viewModel.email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField("Digite sua senha", text: $viewModel.password)
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
            
            // Botão de login com e-mail e senha
            Button(action: {
                Task {
                    await viewModel.signInUser()
                }
            }) {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding()
                } else {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .background(Color.customAccentColor)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .disabled(viewModel.isLoading)
            
            // Navegar para a todoView após login com sucesso
            NavigationLink(destination: TodoView(), isActive: $viewModel.isLoggedIn) {
                EmptyView()
            }
            
            //Login com google
            Button(action: {
                Task {
                    do {
                        try await GoogleAuthService.signInWithGoogle()
                        print("Usuário autenticado com Google")
                        await MainActor.run {
                            viewModel.isLoggedIn = true
                        }
                    } catch {
                        await MainActor.run {
                            viewModel.errorMessage = error.localizedDescription
                            viewModel.showError = true
                        }
                    }
                }
            }) {
                HStack {
                    Spacer()
                    Image("google-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Spacer()
                }
                .frame(height: 50)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.horizontal)
                .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
            }
            .padding(.bottom, 20)
            
            NavigationLink(destination: TodoView(), isActive: $viewModel.isLoggedIn) {
                EmptyView()
            }
            
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
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Erro no login"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
        }
        }
    }
    
    
}

#Preview {
    LoginView()
}
