//
//  PairRM.swift
//  Shedule
//
//  Created by Игорь Сазонов on 06.04.2021.
//

import Foundation
import RealmSwift

class PairRM: Object {
  @objc dynamic var subject: String = ""
  var rooms = List<String>()
  var lecturers = List<LectureRM>()
  @objc dynamic var pair = Int()
  @objc dynamic var type: String = ""
  
  convenience init(subject: String, rooms: List<String>, lectures: List<LectureRM>, pair: Int, type: String) {
    self.init()
    self.subject = subject
    self.rooms = rooms
    self.lecturers = lectures
    self.pair = pair
    self.type = type
  }
}
