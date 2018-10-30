//
//  DIProvider.swift
//  GitHubExp
//
//  Created by marek on 30/10/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import Swinject

struct DIConstants { }

public let assembler = Assembler([
    GitHubUserAssembly()
    ]
)

extension Assembler {
    func get<Service>(name: String) -> Service {
        return self.resolver
            .resolve(Service.self,
                     name: name)!
    }
}
