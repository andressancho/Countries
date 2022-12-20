//
//  Country.swift
//  Countries
//
//  Created by Andres Sancho on 16/12/22.
//

import Foundation

struct Country: Codable {
    var name: String
    var flag: String
//    var capital: String?
    var code: String?
    var continent: String?
    var population: Int?
    var demonym: String?
    
    init() {
        self.name = ""
        self.flag = ""
    }
    
}

extension Country {
    enum keys: String, CodingKey {
        case name
        case flag = "flags"
//        case capital
        case code = "alpha3Code"
        case continet = "region"
        case population
        case demonym
    }
    
    enum FlagKeys: String, CodingKey {
        case flag = "png"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        name = try container.decode(String.self, forKey: .name)
//        capital = try container.decode(String.self, forKey: .capital)
        code = try container.decode(String.self, forKey: .code)
        continent = try container.decode(String.self, forKey: .continet)
        population = try container.decode(Int.self, forKey: .population)
        demonym = try container.decode(String.self, forKey: .demonym)
        
        
        let flagContainer = try container.nestedContainer(keyedBy: FlagKeys.self, forKey: .flag)
        flag = try flagContainer.decode(String.self, forKey: .flag)
    }
    
    
}
