//
//  TriviaRepo.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 21/06/2022.
//

import Foundation

struct TriviaRepo : ITriviaRepo {
    
    func getTriviaQuestions(count: Int, for category: Int = 0) -> ApiResult {
        let url = URL(string: "https://opentdb.com/api.php?amount=\(count)&category=\(category)")
        var apiResult: ApiResult?

        if let url = url {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let error = error {
                    print("an error occurred: \(error)")
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("an error occurred: \(String(describing: response))")
                    return
                }

                if let data = data {
                    apiResult = try? JSONDecoder().decode(ApiResult.self, from: data)
                }
                return
            })
            
            task.resume()
        }
        
        if let parsedResult = apiResult {
            return parsedResult
        }
        
        return ApiResult.defaultResponse()
    }
}
