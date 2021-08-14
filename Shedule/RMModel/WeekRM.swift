//
//  WeekRM.swift
//  Shedule
//
//  Created by Игорь Сазонов on 06.04.2021.
//

import Foundation
import RealmSwift

class WeekRM: Object {
  var monday = List<PairRM>()
  var tuesday = List<PairRM>()
  var wednesday = List<PairRM>()
  var thursday = List<PairRM>()
  var friday = List<PairRM>()
  var saturday = List<PairRM>()
  
  convenience init(monday: List<PairRM>, tuesday: List<PairRM>, wednesday: List<PairRM>, thursday: List<PairRM>, friday: List<PairRM>, saturday: List<PairRM>) {
    self.init()
    self.monday = monday
    self.tuesday = tuesday
    self.wednesday = wednesday
    self.thursday = thursday
    self.friday = friday
    self.saturday = saturday
  }
  
  convenience init(monday: List<PairRM>) {
    self.init()
    self.monday = monday
  }
}
