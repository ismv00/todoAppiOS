// TodoView.swift
// TodoApp
//
// Created by Igor S. Menezes on 05/05/25.

import SwiftUI

struct TodoView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Foto de Perfil
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.customAccentColor)
                    .padding(.top, 40)
                    .onTapGesture {
                        print("Abrir galeria de fotos")
                    }
                
                // Texto de boas-vindas
                Text("Welcome, Igor!")
                    .font(.title2).bold()
                    .foregroundStyle(.black)
                    .padding(.top, 10)
                Text("Good Afternoon")
                    .font(.subheadline)
                    .foregroundStyle(.black.opacity(0.7))
                
                // Calendário (placeholder)
                Rectangle()
                    .frame(height: 200)
                    .foregroundColor(Color.customAccentColor.opacity(0.2))
                    .cornerRadius(15)
                    .overlay(Text("Calendário - Em breve"))
                    .padding(.horizontal)
                
                // Lista de tarefas
                VStack(alignment: .leading, spacing: 15) {
                    Text("Task List")
                        .font(.title3).bold()
                        .foregroundStyle(.black)
                    
                    NavigationLink(destination: TodoDetailsView()) {    
                        VStack(alignment: .leading, spacing: 5) {
                            Text("• Learn programming by 12 am")
                            Text("• Learn how to cook by 1 pm")
                            Text("• Pick up the kids by 2 pm")
                            Text("• Have lunch by 3 pm")
                            Text("• Go visit mum by 4 pm")
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
                
                Spacer()
            }
            .background(Color.customBackgroundColor.ignoresSafeArea())
        }
    }
}

#Preview {
    TodoView()
}
