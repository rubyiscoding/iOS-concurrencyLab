//
//  GeekJokeAPI.swift
//  concurrentcy
//
//  Created by Pink Zen on 2023-09-26.
//

import Foundation

struct GeekJokeResponse: Codable {
    let joke: String
}

enum GeekJokeAPIError: Error {
    case cannotConvertStringToURL
    case networkError(Error)
}

class GeekJokeAPI {
    static private let baseURLString = "https://geek-jokes.sameerkumar.website/api?format=json" // Geek Joke API URL
    
    static public func fetchGeekJoke() async throws -> GeekJokeResponse {
        guard let url = URL(string: baseURLString) else {
            throw GeekJokeAPIError.cannotConvertStringToURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let response = try JSONDecoder().decode(GeekJokeResponse.self, from: data)
            
            return response
        } catch {
            throw GeekJokeAPIError.networkError(error)
        }
    }
}
