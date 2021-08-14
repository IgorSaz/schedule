//
//  SheduleTableViewCell.swift
//  Shedule
//
//  Created by Игорь Сазонов on 22.02.2021.
//

import UIKit

class SheduleTableViewCell: UITableViewCell {

  @IBOutlet var pairView: UIView!
  
  @IBOutlet var timePairLabel: UILabel!
  @IBOutlet var namePairLabel: UILabel!
  @IBOutlet var auditoriumPairLabel: UILabel!
  @IBOutlet var nameTeacherLabel: UILabel!
  @IBOutlet var typePairLabel: UILabel!
  
  private func configureView() {
    pairView.layer.cornerRadius = 20
    timePairLabel.textColor = UIColor(named: "textColor")
    namePairLabel.textColor = UIColor(named: "textColor")
    auditoriumPairLabel.textColor = UIColor(named: "textColor")
    nameTeacherLabel.textColor = UIColor(named: "textColor")
    typePairLabel.textColor = UIColor(named: "textColor")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureView()
  }
  
  public func configure(numberPair: Int, namePair: String, auditoriumPair: [String], nameTeacher: [LectureLocal], typePair: String) {
    
    switch numberPair { // number Pair
    case 1:
      timePairLabel.text = "08:30"
    case 2:
      timePairLabel.text = "10:10"
    case 3:
      timePairLabel.text = "11:50"
    case 4:
      timePairLabel.text = "14:00"
    case 5:
      timePairLabel.text = "15:40"
    case 6:
      timePairLabel.text = "17:20"
    case 7:
      timePairLabel.text = "19:00"
    default:
      timePairLabel.text = ""
    }
    
    namePairLabel.text = namePair
    
    if !auditoriumPair.isEmpty {
      auditoriumPairLabel.text = auditoriumPair[0]
    } else {
      auditoriumPairLabel.text = ""
    }
    
    if !nameTeacher.isEmpty {
      nameTeacherLabel.text = nameTeacher[0].fullName
    } else {
      nameTeacherLabel.text = ""
    }
    
    switch typePair { // type Pair
    case "practics":
      typePairLabel.text = "ПЗ"
    case "lecture":
      typePairLabel.text = "Л"
    case "lab":
      typePairLabel.text = "ЛЗ"
    default:
      typePairLabel.text = ""
    }
  }
}
