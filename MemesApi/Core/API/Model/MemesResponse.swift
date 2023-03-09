//
//  MemesResponse.swift
//  MemesApi
//
//  Created by Xursandbek Qambaraliyev on 02/03/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let success: Bool
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let memes: [Meme]
}

// MARK: - Meme
struct Meme: Codable {
    let id, name: String
    let url: String
    let width, height, boxCount, captions: Int

    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
        case captions
    }
}
