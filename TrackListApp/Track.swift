//
//  Track.swift
//  TrackListApp
//
//  Created by ALEKSEY SUSLOV on 27.07.2022.
//

struct Track {
    let artist: String
    let song: String
    
    var title: String {
        return "\(artist) - \(song)"
    }
}
