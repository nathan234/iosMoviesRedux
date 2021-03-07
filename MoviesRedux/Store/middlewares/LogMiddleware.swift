//
//  LogMiddleware.swift
//  MoviesRedux
//
//  Created by Nathan Retta on 3/6/21.
//

import Foundation

func logMiddleware() -> Middleware<AppState>
{
    return { state, action, dispatech in
        print("[Log Middleware]")
    }
}
