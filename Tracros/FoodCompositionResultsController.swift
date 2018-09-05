//
//  FoodCompositionResultsController.swift
//  Tracros
//
//  Created by Jake Gray on 7/30/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

class FoodCompositionResultsController {
    
    static func fetchItem(withID id: String, completion: @escaping(SearchFoodItem?) -> Void) {
        
        let queries = [
            "api_key" : apiKey,
            "format" : format,
            "ndbno" : id,
            "type" : type
        ]
        
        let url = itemInfoURL?.withQueries(queries)
        print(url!)
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, _, error) in
            if let error = error {
                print("Error Searching for term: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = data {
                do{
                    let jsonDecoder = JSONDecoder()
                    let compDict = try jsonDecoder.decode(DataResultsDictionary.self, from: data)
                    let foods = compDict.foods.first
                    let foodItem = foods?.food
                    completion(foodItem)
                    
                } catch let error{
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
}
