//
//  TodoAppTests.swift
//  TodoAppTests
//
//  Created by Ihor Shevchuk on 26.08.2023.
//
//

import XCTest
@testable import TodoApp

class MockDataStore : DataStoreInterface {
    var todos: [Todo] = []

    func save(_ todo: Todo) {
        todos.append(todo)
    }

    func delete(_ todo: Todo) {
        todos.removeAll(where: { $0.id == todo.id })
    }

    func getAll() -> [Todo] {
        return todos
    }

    func complete(_ todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted = true
        }
    }
}

final class TodoAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testAddTask() throws {
        let dataStore = MockDataStore()
        let viewModel = ContentViewModel(dataStore: dataStore)
        viewModel.addTask(title: "Test Task")
        XCTAssertEqual(dataStore.todos.count, 1)
        XCTAssertEqual(dataStore.todos[0].title, "Test Task")
    }

    func testDeleteTask() throws {
        let dataStore = MockDataStore()
        let viewModel = ContentViewModel(dataStore: dataStore)
        viewModel.addTask(title: "Test Task")
        viewModel.deleteTask(dataStore.todos[0])
        XCTAssertEqual(dataStore.todos.count, 0)
    }

    func testCompleteTask() throws {
        let dataStore = MockDataStore()
        let viewModel = ContentViewModel(dataStore: dataStore)
        viewModel.addTask(title: "Test Task")
        viewModel.completeTask(dataStore.todos[0])
        XCTAssertEqual(dataStore.todos[0].isCompleted, true)
    }

    func testGetAll() throws {
        let dataStore = MockDataStore()
        let viewModel = ContentViewModel(dataStore: dataStore)
        viewModel.addTask(title: "Test Task")
        viewModel.addTask(title: "Test Task 2")
        XCTAssertEqual(viewModel.todos.count, 2)
    }

    func testTodoWithTimestamp() throws {
        let timestamp = "Test".todoWithTimestamp
        XCTAssertNotEqual(timestamp, "Test")
    }
}
