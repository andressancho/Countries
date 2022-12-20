//
//  CountryListTableViewController.swift
//  Countries
//
//  Created by Andres Sancho on 16/12/22.
//

import UIKit
import Combine

class CountryListTableViewController: UITableViewController {
    
    
    private let countryListViewModel = CountriesListViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suscribeSignals()
        countryListViewModel.getData()
    }

    
    /// Suscribe signals.
    func suscribeSignals() {
        countryListViewModel.$state.sink(receiveValue: { [weak self] newState in
            
            switch(newState){
            case .success:
                self?.tableView.reloadData()
                break
            case .idle:
                break
            case .loading:
                break
            case .errored(error: let error):
                break
            }

        }).store(in: &cancellables)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return countryListViewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryListViewModel.numberOfRows(inSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryTableViewCell", for: indexPath) as! CountryTableViewCell
        
        let country = countryListViewModel.object(atIndexPath: indexPath)
        
        cell.setupCell(name: country.name, flagUrl: URL(string: country.flag))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let country = episodeListViewModel.object(atIndexPath: indexPath)
//        let episodeViewModel = EpisodeViewModel(episode: episode)
//        performSegue(withIdentifier: "episodeDetailSegue", sender: episodeViewModel)
    }
    

    
    
    
    

}
