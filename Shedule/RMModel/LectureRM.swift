//
//  LectureRM.swift
//  Shedule
//
//  Created by Игорь Сазонов on 06.04.2021.
//

import Foundation
import RealmSwift

class LectureRM: Object {
  @objc dynamic var fullName: String = ""
  
  convenience init(fullName: String) {
    self.init()
    self.fullName = fullName
  }
}
