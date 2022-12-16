//
//  CountryApi.swift
//  Countries
//
//  Created by Andres Sancho on 16/12/22.
//

import Foundation
import Moya

// General provider, this change if is running test or normal.
var CountryApiProvider: MoyaProvider<CountryApi> {
    return MoyaProvider<CountryApi>(plugins:  [NetworkLoggerPlugin()])
    
}


enum CountryApi {
    case getCountries
}

extension CountryApi: TargetType {
    var baseURL: URL {
        if let url = URL(string: "https://restcountries.com/v2/") {
            return url
        }
        fatalError("country api url issue")
    }
    
    var path: String {
        switch self {
        case .getCountries:
            return "all"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCountries:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCountries:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
