//
//  TodoView.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 17/05/25.
//

import SwiftUI

struct TodoView: View {
    
    
    var body: some View {
        VStack(spacing: 20) {
            // Foto do perfil
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(Color.customAccentColor)
                .padding(.top, 10)
                .onTapGesture {
                    print("Abrir galeria de fotos")
                }
            
            Text("Bem vindo, Igor!")
                .font(.title2).bold()
                .foregroundStyle(.black)
                .padding(.top, 10)
            Text("Boa tarde!")
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.7))
            
            //Calendário
            Rectangle()
                .frame(height: 200)
                .foregroundStyle(Color.customAccentColor.opacity(0.2))
                .cornerRadius(15)
                .overlay(Text("Calendário - Em breve"))
                .padding(.horizontal)
            
            //Lista de Tarefas
            VStack(alignment: .leading, spacing: 15) {
                Text("Lista de tarefas")
                    .font(.title3).bold()
                    .foregroundStyle(.black)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Tarefas diárias")
                        .font(.headline)
                        .foregroundStyle(.black.opacity(0.7))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("* Learn programing by 12am")
                        Text("* Learn how to cook by 1 am")
                        Text("* Learn programing by 12am")
                        Text("* Learn programing by 12am")
                        Text("* Learn programing by 12am")
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

#Preview {
    TodoView()
}
