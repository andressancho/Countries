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
                let countries = try response.map([Country].self)
                for country in countries {
                    if(country.independent!){
                        self.currentData.append(country)
                    }
                        
                }
                self.state = .success
                self.state = .idle
            } catch {
                self.state = .errored(error: "error al cargar países")
                self.state = .idle
            }
        })
    }
    
    func randomCountry() -> Country {
        let random = Int.random(in: 0 ... self.currentData.count)
        return self.currentData[random]
    }
}
