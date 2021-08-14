//
//  Parse.swift
//  Shedule
//
//  Created by Игорь Сазонов on 28.02.2021.
//

import Foundation

// MARK: - Let and Var
/*
var urlString = "https://github.com/igorsazonov/sevsu_shedule/raw/main/output/"
let nameGroup = UserDefaults.standard.string(forKey: "group") ?? ""
let encodingNameGroup = nameGroup.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)*/

class ParserShedule {
    // MARK: - func
    
    func parseGroup(completionHandler: @escaping (Schedule) -> Void, errorHandler: @escaping (Error?) -> Void) {
      
      var urlString = "https://github.com/igorsazonov/sevsu_shedule/raw/main/output/"
      let nameGroup = UserDefaults.standard.string(forKey: "group") ?? ""
      let encodingNameGroup = nameGroup.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
      
        
        urlString = urlString + encodingNameGroup! + ".json" // формируем urlString
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
                return
            }
          
            do {
                let shedule = try JSONDecoder().decode(Schedule.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(shedule)
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
