//
//  ViewModel.swift
//  News
//
//  Created by Shinhyuk on 2022/05/07.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject{
    
    enum State{
        case loading
        case loaded(NewsResponse)
        case error(Error)
    }
    
    @Published var newsState = State.loading
    let newsService = NewsService()
    var cancellable = Set<AnyCancellable>()
    
    init(){
        loadNews()
    }
    
    func loadNews(){
        newsService.getNews()
            .sink { [weak self] completion in
                switch completion{
                case .failure(let error):
                    self?.newsState = State.error(error)
                case.finished: break
                }
            } receiveValue: { [weak self] NewsResponse in
                self?.newsState = State.loaded(NewsResponse)
            }.store(in: &cancellable)
    }
}
