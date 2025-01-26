//
//  BuildConfiguration.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import Foundation

enum API {
    static var baseURL: String {
        do {
            return try BuildConfiguration.value(for: "API_URL")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

private enum BuildConfiguration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }

        switch object {
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}
