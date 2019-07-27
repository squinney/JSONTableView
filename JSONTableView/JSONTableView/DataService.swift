//
//  DataService.swift
//  JSONTableView
//
//  Created by Stephen Feuerstein on 7/27/19.
//  Copyright © 2019 Refactor Studios. All rights reserved.
//

import Foundation

enum DataServiceErrors: Error {
    case urlError
    case unknownError
}

extension DataServiceErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .urlError:
            return "Unable to create a URL object from the given URL string"
        case .unknownError:
            return "An unknown error occurred during the request."
        }
    }
}

struct DataService {
    /// URL for test data
    private static let urlString = "http://www.filltext.com/?rows=100&fname=%7BfirstName%7D&lname=%7BlastName%7D&city=%7Bcity%7D&pretty=true"
    
    /// Requests an array of people with their first name, last name, and city from a test service
    ///
    /// - Parameter completion: Array of Person objects and/or any Error from the request
    static func getTestData(completion: @escaping ([Person]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, DataServiceErrors.urlError)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let people = try? JSONDecoder().decode([Person].self, from: data)
                completion(people, nil)
            } else if let error = error {
                completion(nil, error)
            } else {
                completion(nil, DataServiceErrors.unknownError)
            }
        }
        
        task.resume()
    }
}
