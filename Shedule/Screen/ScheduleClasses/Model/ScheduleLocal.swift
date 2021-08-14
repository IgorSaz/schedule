//
//  ScheduleLocal.swift
//  Shedule
//
//  Created by Игорь Сазонов on 18.04.2021.
//

import Foundation

class ScheduleLocal {
  let odd: WeekLocal
  let even: WeekLocal
  
  init(odd: WeekLocal, even: WeekLocal) {
    self.odd = odd
    self.even = even
  }
}

class WeekLocal {
  let monday: [PairLocal]
  let tuesday: [PairLocal]
  let wednesday: [PairLocal]
  let thursday: [PairLocal]
  let friday: [PairLocal]
  let saturday: [PairLocal]
  
  init(monday: [PairLocal], tuesday: [PairLocal], wednesday: [PairLocal], thursday: [PairLocal], friday: [PairLocal], saturday: [PairLocal]) {
    self.monday = monday
    self.tuesday = tuesday
    self.wednesday = wednesday
    self.thursday = thursday
    self.friday = friday
    self.saturday = saturday
  }
}

class PairLocal {
  var subject: String = ""
  var rooms: [String] = []
  var lecturers: [LectureLocal] = []
  var pair: Int = 0
  var type: String = ""
}

class LectureLocal {
  var fullName: String = ""
}
