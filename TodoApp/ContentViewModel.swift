//
// Created by Ihor Shevchuk on 26.08.2023.
//

import Foundation

class ContentViewModel: ObservableObject {
    var dataStore: any DataStoreInterface

    @Published var todos: [Todo] = []

    init(dataStore: any DataStoreInterface) {
        self.dataStore = dataStore
        todos = dataStore.getAll()
    }

    func addTask(title: String) {
        let todo = Todo(
            title: title
        )
        dataStore.save(todo)
        todos = dataStore.getAll()
    }

    func deleteTask(_ todo: Todo) {
        dataStore.delete(todo)
        todos = dataStore.getAll()
    }

    func completeTask(_ todo: Todo) {
        dataStore.complete(todo)
        todos = dataStore.getAll()
    }
}
