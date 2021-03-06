//
//  IonixWSClient.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import Moya

struct IonixWSClient {
    // MARK: - Services
    static func search(rut: String, completion: ((Result<SearchResult, String>) -> Void)? = nil) {
        IonixProvider.provider.request(.search(rut: rut)) { result in
            switch result {
            case let .success(response):
                do {
                    completion?(.success(try response.filterSuccessfulStatusAndRedirectCodes().map(SearchResult.self)))
                } catch let error {
                    completion?(.failure(error.localizedDescription))
                }
            case let .failure(error): completion?(.failure(error.localizedDescription))
            }
        }
    }
}
