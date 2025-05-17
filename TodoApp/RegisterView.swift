//
//  RegisterView.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 17/05/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    
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
            
            TextField("Digite seu nome completo", text: $fullName)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            
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
            
            SecureField("Confirme sua senha", text: $confirmPassword)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                print("Register")
            }) {
                Text("Registrar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customAccentColor)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
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
        }
    }
}

#Preview {
    RegisterView()
}
