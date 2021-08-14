//
//  ScheduleRM.swift
//  Shedule
//
//  Created by Игорь Сазонов on 06.04.2021.
//

import Foundation
import RealmSwift

class ScheduleRM: Object {
  @objc dynamic var odd: WeekRM?
  @objc dynamic var even: WeekRM?
  @objc dynamic var isEmpty = true
  
  convenience init(odd: WeekRM?, even: WeekRM?, isEmpty: Bool) {
    self.init()
    self.odd = odd
    self.even = even
    self.isEmpty = isEmpty
  }
}
