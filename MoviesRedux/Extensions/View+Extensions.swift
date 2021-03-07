//
//  View+Extensions.swift
//  MoviesRedux
//
//  Created by Nathan Retta on 3/6/21.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView {self}
    }
}
