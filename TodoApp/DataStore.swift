//
// Created by Ihor Shevchuk on 26.08.2023.
//

import Foundation

protocol DataStoreInterface : ObservableObject, AnyObject {
    func save(_ todo: Todo)
    func delete(_ todo: Todo)
    func getAll() -> [Todo]
    func complete(_ todo: Todo)
}

class DataStore {

    var backend = UserDefaults.standard

    private func save(todos: [Todo]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(todos) {
            backend.set(encoded, forKey: "todos")
        }
    }

    private func readTodos() -> [Todo] {
        let decoder = JSONDecoder()
        if let data = backend.data(forKey: "todos") {
            if let decoded = try? decoder.decode([Todo].self, from: data) {
                return decoded
            }
        }
        return []
    }
}

extension DataStore: DataStoreInterface {
    func save(_ todo: Todo) {
        var todos = readTodos()
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index] = todo
        } else {
            todos.append(todo)
        }
        save(todos: todos)
    }

    func complete(_ todo: Todo) {
        var todos = readTodos()
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted = true
        }
        save(todos: todos)
    }

    func delete(_ todo: Todo) {
        var todos = readTodos()
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos.remove(at: index)
            save(todos: todos)
        }
    }

    func getAll() -> [Todo] {
        return readTodos()
    }
}