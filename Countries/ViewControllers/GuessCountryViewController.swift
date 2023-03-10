//
//  GuessCountryViewController.swift
//  Countries
//
//  Created by Andres Sancho on 27/1/23.
//

import UIKit
import Combine
import SDWebImage

class GuessCountryViewController: UIViewController {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var countryNameLabel: UILabel!
    private let countryListViewModel = CountriesListViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        suscribeSignals()
        countryListViewModel.getData()
    }
    
    func suscribeSignals() {
        countryListViewModel.$state.sink(receiveValue: { [weak self] newState in
            
            switch(newState){
            case .success:
                let country = self?.countryListViewModel.randomCountry()
                self?.flagImageView.sd_setImage(with: URL(string: country!.flag!))
                self?.countryNameLabel.text = country?.name
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
    
    func initUI() {
        countryNameLabel.isHidden = true;
        
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        let country = countryListViewModel.randomCountry()
        flagImageView.sd_setImage(with: URL(string: country.flag!))
        countryNameLabel.text = country.name
        if(!countryNameLabel.isHidden){
            countryNameLabel.isHidden = true;
        }
    }
    @IBAction func flagButtonPressed(_ sender: Any) {
        countryNameLabel.isHidden = !countryNameLabel.isHidden;
    }
}
