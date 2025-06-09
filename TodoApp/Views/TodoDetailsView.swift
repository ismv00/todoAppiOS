//
//  TodoDetailsView.swift
//  TodoApp
//
//  Created by Igor S. Menezes on 17/05/25.
//

import SwiftUI

struct TodoDetailsView: View {
    @State private var newTask = ""
    @State private var tasks = ["Learn programming by 12 am", "Learn how to cook by 1 pm", "Pick up the kids by 2 pm", "Have lunch by 3 pm", "Go visit mom by 4 pm"]
    @State private var completedTasks = Set<String>()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Minhas tarefas")
                .font(.largeTitle).bold()
                .padding(.horizontal)
                .foregroundStyle(.black)
            
            HStack {
                TextField("Nova Tarefa", text: $newTask)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(action: {
                    addTask()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(Color.customAccentColor)
                }
                .padding(.trailing)
            }
            
            ScrollView{
                VStack(spacing: 15) {
                    ForEach(tasks, id: \ .self) { task in
                        HStack {
                            Toggle(isOn: Binding(get: {self.completedTasks.contains(task)}, set: {isCompleted in
                                if isCompleted {
                                    self.completedTasks.insert(task)
                                } else {
                                    self.completedTasks.remove(task)
                                }
                            }
                                                )) {
                                Text(task)
                                    .strikethrough(self.completedTasks.contains(task), color: .black)
                                    .foregroundStyle(self.completedTasks.contains(task) ? .gray : .black)
                            }
                            Spacer()
                            Button(action: {
                                removeTask(task)
                            }) {
                                Image(systemName: "trash.fill")
                                    .foregroundStyle(.red)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
            }
            Spacer()
        }
        .background(Color.customBackgroundColor.ignoresSafeArea())
    }
    
    private func addTask() {
        if !newTask.isEmpty {
            tasks.append(newTask)
            newTask = ""
        }
        
    }
    private func removeTask(_ task: String) {
        tasks.removeAll { $0 == task}
        completedTasks.remove(task)
    }
}

#Preview {
    TodoDetailsView()
}
