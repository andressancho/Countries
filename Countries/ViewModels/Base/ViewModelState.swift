//
//  ViewModelState.swift
//  Countries
//
//  Created by Andres Sancho on 16/12/22.
//

import Foundation


enum ViewModelState {
    case idle
    case loading
    case success
    case errored(error: String)
}
