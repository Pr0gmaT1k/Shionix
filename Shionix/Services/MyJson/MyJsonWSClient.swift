//
//  MyJsonWSClient.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import Moya

struct MyJsonWSClient {
    // MARK: - Services
    static func getMenu(completion: ((Result<[[MenuItem]], String>) -> Void)? = nil) {
        MyJsonProvider.provider.request(.menu) { result in
            switch result {
            case let .success(response):
                do {
                    completion?(.success(try response.filterSuccessfulStatusAndRedirectCodes().map([[MenuItem]].self)))
                } catch let error { completion?(.failure(error.localizedDescription)) }
            case let .failure(error): completion?(.failure(error.localizedDescription))
            }
        }
    }
}
