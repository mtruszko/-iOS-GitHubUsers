//
//  UsersMoyaAPI.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import Moya

enum UsersMoyaAPI: TargetType {
    case users
}

extension UsersMoyaAPI {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        return "/users"
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
