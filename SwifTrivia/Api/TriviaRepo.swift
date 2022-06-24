//
//  TriviaRepo.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 21/06/2022.
//

import Foundation

struct TriviaRepo : ITriviaRepo {
    
    func getTriviaQuestions(count: Int, for category: Int? = 0) async -> ApiResult {
        var url: URL?
        if let category = category {
            url = URL(string: "https://opentdb.com/api.php?amount=\(count)&category=\(category)")
        } else {
            url = URL(string: "https://opentdb.com/api.php?amount=\(count)")
        }

        var apiResult: ApiResult = ApiResult.defaultResponse
        
        guard let url = url else {
            return ApiResult.defaultResponse
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decoded = try? JSONDecoder().decode(ApiResult.self, from: data) {
                apiResult = decoded
            }
            
        } catch {
           print("error")
        }

//        if let url = url {
//            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//
//                if let error = error {
//                    print("an error occurred: \(error)")
//                    return
//                }
//
//                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                    print("an error occurred: \(String(describing: response))")
//                    return
//                }
//
//                if let data = data {
//                    apiResult = try? JSONDecoder().decode(ApiResult.self, from: data)
//                }
//                return
//            })
//
//            task.resume()
//        }
//
//        if let parsedResult = apiResult {
//            return parsedResult
//        }
        return apiResult
    }
}
