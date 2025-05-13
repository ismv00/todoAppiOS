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
        VStack(spacing: 20) {
            Spacer()
            
            Text("Bem vindo de volta!")
                .font(.largeTitle).bold()
                .foregroundStyle(.black)
            Text("Vamos te ajudar a concluir suas tarefas")
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.7))
            
            Image("login")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            TextField("Digite seu e-mail", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            
            TextField("Digite sua senha", text: $password)
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
            Button(action: {
                print("Login")
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customAccentColor)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("Não tem uma conta?")
                Button(action: {
                    print("Signup")
                }) {
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

#Preview {
    LoginView()
}
