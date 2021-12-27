//  SearchModel.swift
//  PopUp
//  Created by apple on 02/10/1400 AP.
//

import Foundation

// MARK: - Search
struct SearchModel: Codable {
    let status: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let q: String?
    let totalCount, start: Int?
//    let spellingAlternatives: SpellingAlternatives
    let items: [Item]?
    let countInResponse: Int?

    enum CodingKeys: String, CodingKey {
        case q
        case totalCount = "total_count"
        case start
//        case spellingAlternatives = "spelling_alternatives"
        case items
        case countInResponse = "count_in_response"
    }
}

// MARK: - Item
struct Item: Codable {
    let name, type: String?
    let url: String?
    let identifier: String?
    let itemDescription: String?
//    let publishedAt: Date

    enum CodingKeys: String, CodingKey {
        case name, type, url, identifier
        case itemDescription = "description"
//        case publishedAt = "published_at"
    }
}
