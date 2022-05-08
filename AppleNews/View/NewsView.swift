//
//  ContentView.swift
//  News
//
//  Created by Shinhyuk on 2022/05/07.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var newsViewModel = NewsViewModel()
    @State private var serch = ""
    
    var body: some View {
        VStack{
            switch newsViewModel.newsState{
            case .loading:
                ProgressView()
            case .error:
                ErrorView()
            case.loaded(let data):
                NavigationView {
                    List{
                        ForEach(data.articles.filter({serch.isEmpty ? true : $0.title.contains(serch)}), id:\.self){ news in
                            Link(destination: news.url) {
                                HStack{
                                    VStack {
                                        AsyncImage(url: news.urlToImage){ image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                    .frame(width: 150 , height: 100, alignment: .leading)
                                    Text("\(news.title)")
                                }
                            }
                        }
                    }
                    .navigationBarTitle("Apple News")
                }
                .searchable(text: $serch)
            }
        }
    }
}


struct NewsView_preView: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
