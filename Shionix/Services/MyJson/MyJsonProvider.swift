//
//  MyJsonProvider.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import Moya
import RealmSwift

public enum MyJsonProvider: TargetType {
    case menu
    
    public var baseURL: URL { URL(string: Environment.MyJson.baseURL) ?? URL(fileURLWithPath: "error") }
    static let provider = MoyaProvider<Self>()
    
    public var path: String {
        switch self {
        case .menu: return "/bins/h3ayu"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return "to implement to use test".data(using: .utf8) ?? Data()
    }
    
    public var task: Task { return .requestPlain }
    
    public var headers: [String: String]? { return nil }
}
