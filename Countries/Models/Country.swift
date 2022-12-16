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
    
    init() {
        self.name = ""
        self.flag = ""
    }
    
}

extension Country {
    enum keys: String, CodingKey {
        case name
        case flag
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        name = try container.decode(String.self, forKey: .name)
        flag = try container.decode(String.self, forKey: .flag)
    }
    
}
