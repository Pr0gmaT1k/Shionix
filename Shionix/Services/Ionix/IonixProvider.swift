//
//  IonixProvider.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import Moya
import RealmSwift

public enum IonixProvider: TargetType {
    case search(rut: String)
    
    public var baseURL: URL { URL(string: Environment.Ionix.baseURL) ?? URL(fileURLWithPath: "error") }
    static let provider = MoyaProvider<Self>()
    
    public var path: String {
        switch self {
        case .search: return "/test-tecnico/search"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return "to implement to use test".data(using: .utf8) ?? Data()
    }
    
   public var task: Task {
        switch self {
        case .search(let rut): return .requestParameters(parameters: [IonixJsonKeys.rut: rut], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? { return nil }
}
