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
    var capital: [String]?
    var code: String?
    var continent: String?
    var population: Int?
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
        case code = "cca3"
        case continet = "region"
        case population
        case translations 
        case independent
    }
    
    enum FlagKeys: String, CodingKey {
        case png
    }
    
    enum NameKeys: String, CodingKey {
        case common
    }
    
    enum TranslationKeys: String, CodingKey {
        case spanishName = "spa"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        capital = try container.decodeIfPresent([String].self, forKey: .capital)
        code = try container.decode(String.self, forKey: .code)
        continent = try container.decode(String.self, forKey: .continet)
        population = try container.decode(Int.self, forKey: .population)
        independent = try container.decodeIfPresent(Bool.self, forKey: .independent) ?? false
        
        let nameContainer = try container.nestedContainer(keyedBy: NameKeys.self, forKey: .name)
        name = try nameContainer.decode(String.self, forKey: .common)
        
        let flagContainer = try container.nestedContainer(keyedBy: FlagKeys.self, forKey: .flag)
        flag = try flagContainer.decode(String.self, forKey: .png)
        
        let translationContainer = try container.nestedContainer(keyedBy: TranslationKeys.self, forKey: .translations)
        let spanishContainer = try translationContainer.nestedContainer(keyedBy: NameKeys.self, forKey: .spanishName)
        spanishName = try spanishContainer.decode(String.self, forKey: .common)
        
    }
    
    
}
