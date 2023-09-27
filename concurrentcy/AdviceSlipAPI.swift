//
//  AdviceSlipAPI.swift
//  concurrentcy
//
//  Created by Pink Zen on 2023-09-26.
//

import Foundation

struct AdviceSlip: Codable {
    let slip: Slip
}

struct Slip: Codable {
    let id: Int
    let advice: String
}

enum AdviceSlipAPIError: Error {
    case cannotConvertStringToURL
    case networkError(Error)
}

class AdviceSlipAPI {
    static private let baseURLString = "https://api.adviceslip.com/advice"
    
    static public func fetchAdviceSlip() async throws -> AdviceSlip {
        guard let url = URL(string: baseURLString) else {
            throw AdviceSlipAPIError.cannotConvertStringToURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let response = try JSONDecoder().decode(AdviceSlip.self, from: data)
            
            return response
        } catch {
            throw AdviceSlipAPIError.networkError(error)
        }
    }
}

