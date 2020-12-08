//
//  DurationFromatter.swift
//  MimiMusicPlayer
//
//  Created by abuzeid on 08.12.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import Foundation
struct DurationFromatter {
    func display(duration: Double) -> String {
        let seconds = duration.truncatingRemainder(dividingBy: 60).rounded(.toNearestOrAwayFromZero)
        let minutes = (duration / 60).truncatingRemainder(dividingBy: 60).rounded(.down)
        return String(format: "%02.f:%02.f", minutes, seconds)
    }
}
