//
//  Store.swift
//  MoviesRedux
//
//  Created by Nathan Retta on 3/4/21.
//

import Foundation

typealias Dispatcher = (Action) -> Void
typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

protocol ReduxState {}

struct AppState : ReduxState {
    var counterState = CounterState()
    var taskState = TaskState()
}

struct TaskState : ReduxState {
    var tasks: [Task] = [Task]()
}

struct CounterState : ReduxState {
    var counter = 0
}

protocol Action { }

struct IncrementAction : Action { }
struct DecrementAction : Action { }
struct IncrementActionAsync: Action { }
struct AddTaskAction : Action {
    let task: Task
}
struct AddAction : Action {
    let value: Int
}

class Store<StoreState: ReduxState> : ObservableObject {
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middlewares: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState,
         middlewares: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        //        state = reducer(state, action)
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
            
        }
    }
}
