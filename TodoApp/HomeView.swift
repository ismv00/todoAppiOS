//
//  ContentView.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 04/05/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
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
            
            Button(action: {
                //Aqui será a aÇão do botão
            }) {
                Text("Vamos começar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "#9DD4D7"))
                    .foregroundStyle(.black)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
            .padding(.bottom, 40)
        }
        .background(Color(hex: "#EEEEEE").ignoresSafeArea())
        
    }
}

#Preview {
    HomeView()
}
