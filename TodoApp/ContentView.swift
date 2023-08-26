//
//  ContentView.swift
//  TodoApp
//
//  Created by Ihor Shevchuk on 26.08.2023.
//
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewModel
    @State var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                        .frame(height:10)
                TextField("Task Title...", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                Button(action: {
                    if newTaskTitle.isEmpty {
                        return
                    }

                    viewModel.addTask(title: newTaskTitle.todoWithTimestamp)
                    newTaskTitle = ""
                }) {
                    HStack {
                        Spacer()
                        Text("Add Task")
                        Spacer()

                    }
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.black)
                            .cornerRadius(15)
                }
                Spacer()
            }
                    .padding()
                    .navigationBarTitle("Todo App")
        }

    }
}

extension String {
    var todoWithTimestamp: String {
        "\(self) \(Date().timeIntervalSince1970)"
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(dataStore: DataStore()))
    }
}
#endif
