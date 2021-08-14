//
//  Pair.swift
//  Shedule
//
//  Created by Игорь Сазонов on 28.02.2021.
//

import Foundation

struct Pair: Codable {
    let subject: String
    let rooms: [String]
    let lecturers: [Lecture]
    let pair: Int
    let type: String
}
