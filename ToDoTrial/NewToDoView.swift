//
//  NewToDoView.swift
//  ToDoTrial
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI



struct NewToDoView: View {
    @State var title: String
    @State var isImportant: Bool
    @Binding var toDoItems: [ToDoItem]
    @Binding var showNewTask: Bool
    
    var body: some View {
        VStack {
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Enter the Task description...", text: $title)
                .multilineTextAlignment(.center)
                .border(Color.gray, width:1)
                .padding()
                .padding()
            
            Toggle(isOn: $isImportant) {
                Text("Is it important?")
            }
            .padding()
            
            Button(action: {
                self.addTask(title: self.title, isImportant: self.isImportant)
                self.showNewTask = false
            }) {
            Text("Add")
            }
            .padding()
        }
    }
    
    private func addTask(title: String, isImportant: Bool = false) {
        let task = ToDoItem(title: title, isImportant: isImportant)
        toDoItems.append(task)
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title: "", isImportant: false, toDoItems: .constant([]), showNewTask: .constant(true))
    }
}
