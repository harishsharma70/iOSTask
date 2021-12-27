//
//  SearchViewModel.swift
//  PopUp
//
//  Created by apple on 02/10/1400 AP.
//

import Foundation

//MARK: - Class SearchModel
class SearchViewModel {
    
    //MARK: - Variable
    var Search = [Item]()
    
    //MARK: - Search APIData
    func getSearchData(text:String, completionHandler: @escaping () -> Void){
        
        URLSession.shared.dataTask(with: URL(string: "https://demo.dataverse.org/api/search?q=\(text)")!) { [self] (data, response, error)
            in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode(SearchModel.self, from: data)
                        self.Search = userResponse.data?.items ?? []
                        print(self.Search.count)
                        completionHandler()
                        print(userResponse)
                    }
                    catch let jsonError {
                        print(jsonError)
                    }
                }
            }else{
                print(error?.localizedDescription)
            }
        }.resume()
    }
}
