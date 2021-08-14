//
//  Week.swift
//  Shedule
//
//  Created by Игорь Сазонов on 28.02.2021.
//

import Foundation

struct Week: Codable {
    let monday: [Pair]
    let tuesday: [Pair]
    let wednesday: [Pair]
    let thursday: [Pair]
    let friday: [Pair]
    let saturday: [Pair]
}
