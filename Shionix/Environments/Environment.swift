//
//  Environment.swift
//  Meteo
//
//  Created by Julien CLOUPET on 10/11/2017.
//  Copyright © 2017 Pr0g. All rights reserved.
//

enum Environment {
    struct MyJson {
      static let baseURL = "https://api.myjson.com"
      static let appName = "MyJson"
    }
    
    struct Ionix {
      static let baseURL = "https://sandbox.ionix.cl"
      static let appName = "Ionix"
      static let obfuscated = Obfuscator().reveal(key: [40, 31, 30, 45, 29, 93, 87, 84, 85, 65, 83])
        
    }
}
