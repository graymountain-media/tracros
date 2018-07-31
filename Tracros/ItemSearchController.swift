//
//  ItemSearchController.swift
//  Tracros
//
//  Created by Jake Gray on 7/17/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import Foundation

class ItemSearchController {
    
    static func searchForItem(withTerm term: String, completion: @escaping([SearchItems]?) -> Void) {
        
        let queries = [
            "api_key" : apiKey,
            "format" : format,
            "sort" : sort,
            "max" : max,
            "ds" : "Standard Reference",
            terms : term
        ]
        
        let url = searchURl?.withQueries(queries)
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
                    let searchDict = try jsonDecoder.decode(SearchResultsDictionary.self, from: data)
                    let list = searchDict.list
                    let items = list.items
                    completion(items)
                    
                } catch let error{
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
}
