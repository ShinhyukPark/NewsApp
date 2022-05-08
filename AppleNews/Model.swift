//
//  Model.swift
//  News
//
//  Created by Shinhyuk on 2022/05/07.
//

import Foundation

struct NewsResponse: Codable{
    let status: String
    let totalResults: Int
    let articles: [Articles]
}

struct Articles: Codable, Hashable{
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: URL
    let urlToImage: URL
    let publishedAt: String
    let content: String
}

struct Source: Codable, Identifiable, Hashable{
    let id: String?
    let name: String
}
