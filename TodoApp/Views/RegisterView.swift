//
//  RegisterView.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 17/05/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    
    
    var body: some View {
        NavigationStack {
            

        VStack(spacing: 20) {
            Spacer()
            
            Text("Seja bem-vindo!")
                .font(.largeTitle).bold()
                .foregroundStyle(.black)
            
            Text("Vamos te ajudar a concluir suas tarefas")
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.7))
            
            Image("login")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            TextField("Digite seu nome completo", text: $viewModel.fullName)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            
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
            
            SecureField("Confirme sua senha", text: $viewModel.confirmPassword)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                Task {
                    await viewModel.registerUser()
                }
            }) {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding()
                } else {
                    Text("Registrar")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .background(Color.customAccentColor)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .disabled(viewModel.isLoading)
            
            NavigationLink(destination: LoginView(), isActive: $viewModel.registrationComplete) {
                EmptyView()
            }
            
            HStack {
                Text("Já tem uma conta?")
                NavigationLink(destination: LoginView()) {
                    Text("Sign in")
                        .foregroundStyle(Color.customAccentColor)
                }
            }
            .padding(.bottom, 30)
            
            Spacer()
        }
        .background(Color.customBackgroundColor.ignoresSafeArea())
        .alert(isPresented: $viewModel.showError) {
            Alert(
                title: Text("Erro no cadastro"),
                message: Text(viewModel.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        }
    }
}

#Preview {
    RegisterView()
}
