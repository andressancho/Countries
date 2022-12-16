//
//  CountriesListViewModel.swift
//  Countries
//
//  Created by Andres Sancho on 16/12/22.
//

import Foundation

class CountriesListViewModel: BaseListViewModel<Country> {
    
    override func getData(){
        state = .loading
        CountryApiProvider.request(.getCountries, completion: { result in
            do {
                let response = try result.get()
                self.currentData = try response.map([Country].self)
                self.state = .success
                self.state = .idle
            } catch {
                self.state = .errored(error: "error al cargar países")
                self.state = .idle
            }
        })
    }
}
