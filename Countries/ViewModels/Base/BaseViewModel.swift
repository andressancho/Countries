//
//  BaseViewModel.swift
//  Countries
//
//  Created by Andres Sancho on 16/12/22.
//


import Moya

class BaseViewModel {
    @Published var state: ViewModelState = .idle

    
    func getData() { }
    
}
