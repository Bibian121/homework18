//
//  Service.swift
//  15MDz
//
//  Created by Matilda Davydov on 20.10.2022.
//

import Foundation

class Service {
    
    func request(urlString: String, comletion: @escaping (Result<SearchRespone, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    comletion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let films = try JSONDecoder().decode(SearchRespone.self, from: data)
                    comletion(.success(films))
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    comletion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
