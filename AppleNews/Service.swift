//
//  Service.swift
//  News
//
//  Created by Shinhyuk on 2022/05/07.
//

import Foundation
import Combine

class NewsService{
    func getNews() -> AnyPublisher<NewsResponse, Error>{
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-05-07&to=2022-05-07&sortBy=popularity&apiKey=API_KEY")!)
            .map({$0.data})
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
