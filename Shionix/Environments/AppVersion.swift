//
//  AppVersion.swift
//  ios-app-senado
//
//  Created by Pr0g  on 30-12-19.
//  Copyright © 2019 Altavoz . All rights reserved.
//

import Foundation

struct AppVersion {
    static var version: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    static var build: String? {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }

    static var fullVersionString: String? {
        guard let version = version else { return nil }
        guard let build = build else { return version }
        return "\(version) (\(build))"
    }
}
