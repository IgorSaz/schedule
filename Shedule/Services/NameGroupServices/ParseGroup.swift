//
//  Parse.swift
//  Shedule
//
//  Created by Игорь Сазонов on 16.03.2021.
//

import Foundation

// MARK: - Let and Var

class ParserNameGroup {
    // MARK: - func
    
    func parseGroup(completionHandler: @escaping (Institute) -> Void, errorHandler: @escaping (Error?) -> Void) {
        
        let urlString = "https://github.com/igorsazonov/sevsu_shedule/raw/main/output/index.json" // формируем urlString
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        
        let taske = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
              DispatchQueue.main.async {
                errorHandler(error)
              }
              return
            }
          
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                let httpResponse = response as? HTTPURLResponse
                let errorMessage = httpResponse?.statusCode
                let message = String(errorMessage!) //
                print(message)
                return
            }
          
            guard let data = data else {
                DispatchQueue.main.async {
                    errorHandler(NSError(domain: "", code: 0, userInfo: nil))
                }
                return
            }
            do {
                let institute = try JSONDecoder().decode(Institute.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(institute)
                }
            } catch {
                let errorMessage = "Failed JSONDecoder"
                print(errorMessage) // написать AllertController
                return
            }
        }
        taske.resume()
    }
}
