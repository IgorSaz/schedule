//
//  twoPairTableViewCell.swift
//  Shedule
//
//  Created by Игорь Сазонов on 02.03.2021.
//

import UIKit

class TwoPairTableViewCell: UITableViewCell {

  @IBOutlet var pairView: UIView!
  @IBOutlet var timePairLabel: UILabel!
  
  @IBOutlet var firstNamePairLabel: UILabel!
  @IBOutlet var firstNameTeacherLabel: UILabel!
  @IBOutlet var firstAuditoriumPairLabel: UILabel!
  @IBOutlet var firstTypePairLabel: UILabel!
  
  @IBOutlet var secondNamePairLabel: UILabel!
  @IBOutlet var secondNameTeacherLabel: UILabel!
  @IBOutlet var secondAuditoriumPairLabel: UILabel!
  @IBOutlet var secondTypePairLabel: UILabel!
  
  private func configureView() {
    pairView.layer.cornerRadius = 20
    pairView.backgroundColor = #colorLiteral(red: 0.08299512416, green: 0.4790764451, blue: 0.9991850257, alpha: 1)
    
    timePairLabel.textColor = UIColor(named: "appColor")
    
    firstNamePairLabel.textColor = UIColor(named: "appColor")
    firstAuditoriumPairLabel.textColor = UIColor(named: "appColor")
    firstNameTeacherLabel.textColor = UIColor(named: "appColor")
    firstTypePairLabel.textColor = UIColor(named: "appColor")
    
    secondNamePairLabel.textColor = UIColor(named: "appColor")
    secondAuditoriumPairLabel.textColor = UIColor(named: "appColor")
    secondNameTeacherLabel.textColor = UIColor(named: "appColor")
    secondTypePairLabel.textColor = UIColor(named: "appColor")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureView()
  }
  
  public func configure(numberPair: Int, firstNamePair: String, firstAuditoriumPair: [String], firstNameTeacher: [LectureLocal], firstTypePair: String, secondNamePair: String, secondAuditoriumPair: [String], secondNameTeacher: [LectureLocal], secondTypePair: String) {
    
    switch numberPair {
      case 1:
        timePairLabel.text = "8:30"
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
    
    firstNamePairLabel.text = firstNamePair
    secondNamePairLabel.text = secondNamePair
    
    if !firstAuditoriumPair.isEmpty {
      firstAuditoriumPairLabel.text = firstAuditoriumPair[0]
    } else {
      firstAuditoriumPairLabel.text = ""
    }
    
    if !secondAuditoriumPair.isEmpty {
      secondAuditoriumPairLabel.text = secondAuditoriumPair[0]
    } else {
      secondAuditoriumPairLabel.text = ""
    }
    
    if !firstNameTeacher.isEmpty {
      firstNameTeacherLabel.text = firstNameTeacher[0].fullName
    } else {
      firstNameTeacherLabel.text = ""
    }
    
    if !secondNameTeacher.isEmpty {
      secondNameTeacherLabel.text = secondNameTeacher[0].fullName
    } else {
      secondNameTeacherLabel.text = ""
    }
    
    switch firstTypePair { // type Pair
    case "practics":
      firstTypePairLabel.text = "ПЗ"
    case "lecture":
      firstTypePairLabel.text = "Л"
    case "lab":
      firstTypePairLabel.text = "ЛЗ"
    default:
      firstTypePairLabel.text = ""
    }
    
    switch secondTypePair { // type Pair
    case "practics":
      secondTypePairLabel.text = "ПЗ"
    case "lecture":
      secondTypePairLabel.text = "Л"
    case "lab":
      secondTypePairLabel.text = "ЛЗ"
    default:
      secondTypePairLabel.text = ""
    }
  }
}
