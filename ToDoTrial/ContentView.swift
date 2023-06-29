//
//  ContentView.swift
//  ToDoTrial
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var toDoItems : [ToDoItem] = []
    @State private var showNewTask = false
    
    var body: some View {
        
        VStack {
            HStack {
                
                Text("To Do List")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Button(action: {
                    self.showNewTask = true
                }) {
                    Text("+")
            }
           
            }
            Spacer()
        }
        
        List {
            ForEach (toDoItems) { toDoItem in
                if toDoItem.isImportant == true {
                    Text("‼️ " + toDoItem.title)
                } else {
                    Text(toDoItem.title)
                }
                
            }
        }
        .listStyle(.plain)

        if showNewTask {
            NewToDoView(title: "", isImportant : false, toDoItems: $toDoItems, showNewTask: $showNewTask)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
