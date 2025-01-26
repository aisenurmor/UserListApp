//
//  NetworkManager.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import Foundation

protocol NetworkManagerProtocol {
    func performRequest<T: Decodable>(with builder: ApiRequestBuilder, decodingType: T.Type) async throws -> T
}

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func performRequest<T: Decodable>(with builder: ApiRequestBuilder, decodingType: T.Type) async throws -> T {
        var urlString = API.baseURL + builder.endpoint.path
        
        if let urlParams = builder.urlParams {
            let queryItems = urlParams.map { URLQueryItem(name: $0.key, value: $0.value) }
            var components = URLComponents(string: urlString)
            components?.queryItems = queryItems
            urlString = components?.url?.absoluteString ?? urlString
        }
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = builder.httpMethod.rawValue
        
        if let headers = builder.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        if builder.httpMethod == .post || builder.httpMethod == .put, let payload = builder.payload {
            request.httpBody = try? JSONSerialization.data(withJSONObject: payload)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw error
        }
    }
}

