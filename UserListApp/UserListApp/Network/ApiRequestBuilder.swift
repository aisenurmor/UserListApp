//
//  ApiRequestBuilder.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

final class ApiRequestBuilder {
    var httpMethod: HTTPMethod
    var endpoint: Endpoint
    var urlParams: [String: String]?
    var headers: [String: String]?
    var payload: [String: Any]?
    var filters: [String: String]?
    var searchBy: [String: String]?

    init(endpoint: Endpoint, httpMethod: HTTPMethod) {
        self.endpoint = endpoint
        self.httpMethod = httpMethod
    }

    func urlParams(urlParams: [String: String]?) -> ApiRequestBuilder {
        self.urlParams = urlParams
        return self
    }

    func headers(headers: [String: String]) -> ApiRequestBuilder {
        self.headers = headers
        return self
    }

    func payload(payload: [String: Any]) -> ApiRequestBuilder {
        self.payload = payload
        return self
    }

    func filters(filters: [String: String]) -> ApiRequestBuilder {
        self.filters = filters
        return self
    }

    func searchBy(searchBy: [String: String]) -> ApiRequestBuilder {
        self.searchBy = searchBy
        return self
    }
}

// MARK: - HTTPMethod
enum HTTPMethod:String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
