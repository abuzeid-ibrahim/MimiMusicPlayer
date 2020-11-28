//
//  Song.swift
//  MimiMusicPlayer
//
//  Created by abuzeid on 26.11.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import Foundation

struct Song {
    let id: String
    let userID: String
    let duration: String
    let genre, title: String?
    let thumb: URL?
    let waveformData: URL
    let waveformURL: URL
    let user: Artist?
    let streamURL: URL
}

extension Song: Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Song: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case duration
        case genre
        case title
        case thumb
        case waveformData = "waveform_data"
        case waveformURL = "waveform_url"
        case user
        case streamURL = "stream_url"
    }
}