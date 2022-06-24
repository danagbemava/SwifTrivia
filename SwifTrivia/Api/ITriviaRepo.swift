//
//  ITriviaRepo.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 21/06/2022.
//

import Foundation

protocol ITriviaRepo {
    
    func getTriviaQuestions(count: Int, for category: Int?) async -> ApiResult
}
