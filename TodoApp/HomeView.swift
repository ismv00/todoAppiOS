//
//  ContentView.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 04/05/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer()
                
                Image("main")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Text("Organize suas vida com o ToDo!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(.top, 20)
                
                Text("Crie, gerencie e conclua suas tarefas de forma prática. \n Mantenha seu dia em ordem com poucos toques.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                
                Spacer()
                
                NavigationLink(destination: LoginView()) {
                    Text("Vamos começar")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex:"#9DD4D7"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        
        }
        .background(Color(hex: "#EEEEEE"))
        .ignoresSafeArea()
        
    }
}

#Preview {
    HomeView()
}
