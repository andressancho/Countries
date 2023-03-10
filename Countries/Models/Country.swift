//
//  Country.swift
//  Countries
//
//  Created by Andres Sancho on 16/12/22.
//

import Foundation

struct Country: Codable {
    var name: String?
    var flag: String?
    var capital: String?
    var code: String?
    var continent: String?
    var population: Int?
    var demonym: String?
    var spanishName: String?
    var independent: Bool?
    
    
    init() {
    }
    
}

extension Country {
    enum keys: String, CodingKey {
        case name
        case flag = "flags"
        case capital
        case code = "alpha3Code"
        case continet = "region"
        case population
        case demonym
        case spanishName = "translations"
        case independent
    }
    
    enum FlagKeys: String, CodingKey {
        case flag = "png"
    }
    
    enum TranslationKeys: String, CodingKey {
        case spanishName = "es"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        name = try container.decode(String.self, forKey: .name)
        capital = try container.decodeIfPresent(String.self, forKey: .capital)
        code = try container.decode(String.self, forKey: .code)
        continent = try container.decode(String.self, forKey: .continet)
        population = try container.decode(Int.self, forKey: .population)
        demonym = try container.decode(String.self, forKey: .demonym)
        independent = try container.decode(Bool.self, forKey: .independent)
        
        
        let flagContainer = try container.nestedContainer(keyedBy: FlagKeys.self, forKey: .flag)
        flag = try flagContainer.decode(String.self, forKey: .flag)
        
        let translationContainer = try container.nestedContainer(keyedBy: TranslationKeys.self, forKey: .spanishName)
        spanishName = try translationContainer.decode(String.self, forKey: .spanishName)
    }
    
    
}
