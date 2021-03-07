//
//  MoviesReduxApp.swift
//  MoviesRedux
//
//  Created by Nathan Retta on 3/4/21.
//

import SwiftUI

@main
struct MoviesRedux: App {
    var body: some Scene {
        
        let store = Store(reducer: appReducer,
                          state: AppState(),
                          middlewares: [logMiddleware(), incrementMiddleware()])
        
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
