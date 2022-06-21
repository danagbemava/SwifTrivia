//
//  ApiResult.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 21/06/2022.
//

import Foundation

struct ApiResult : Codable {
    
    var responseCode: Int
    var questions: [Question]
    
   
    enum CodingKeys : String, CodingKey {
        case responseCode = "response_code"
        case questions = "results"
    }
    
}


extension ApiResult {
    static func defaultResponse() -> ApiResult {
        return ApiResult(responseCode: 0, questions: [])
    }
}
