//
//  EmailModel.swift
//  PopUp
//
//  Created by apple on 23/09/1400 AP.
//

import Foundation

// MARK: - EmailModel
struct EmailModel: Codable {
    let page, perPage, total, totalPages: Int
    let data: [emailDatum]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data,support
    }
}

// MARK: - emailDatum
struct emailDatum: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}




