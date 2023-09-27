
//
//  MeowfactsAPI.swift
//  concurrentcy
//
//  Created by Pink Zen on 2023-09-26.
//

import Foundation

struct MeowfactsResponse: Codable {
    let data: [String]
}

enum MeowfactsAPIError: Error {
    case cannotConvertStringToURL
    case networkError(Error)
}

class MeowfactsAPI {
    static private let baseURLString = "https://meowfacts.herokuapp.com/?count=3" // Meowfacts API URL
    
    static public func fetchMeowfacts() async throws -> MeowfactsResponse {
        guard let url = URL(string: baseURLString) else {
            throw MeowfactsAPIError.cannotConvertStringToURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let response = try JSONDecoder().decode(MeowfactsResponse.self, from: data)
            
            return response
        } catch {
            throw MeowfactsAPIError.networkError(error)
        }
    }
}
