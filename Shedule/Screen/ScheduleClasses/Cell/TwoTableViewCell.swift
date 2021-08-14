//
//  TwoTableViewCell.swift
//  Shedule
//
//  Created by Игорь Сазонов on 08.05.2021.
//

import UIKit

class TwoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var basView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var firstNamePairLabel: UILabel!
    @IBOutlet weak var firstTypePairLabel: UILabel!
    @IBOutlet weak var firstNameTeacherLabel: UILabel!
    @IBOutlet weak var firstAuditoriumLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var secondNamePairLabel: UILabel!
    @IBOutlet weak var secondTypePairLabel: UILabel!
    @IBOutlet weak var secondNameTeacherLabel: UILabel!
    @IBOutlet weak var secondAuditoriumLabel: UILabel!
    
    private func setupViews() {
        basView.anchor(contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 176)
        basView.backgroundColor = UIColor(named: "cellColor")
        basView.layer.cornerRadius = 20
        
        timeLabel.anchor(basView.topAnchor, left: basView.leftAnchor, bottom: nil, right: basView.rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 20)
        timeLabel.backgroundColor = UIColor(named: "cellColor")
        //time.textColor = UIColor(named: "appColor")
        
        
        firstNamePairLabel.anchor(timeLabel.bottomAnchor, left: timeLabel.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
        firstNamePairLabel.backgroundColor = UIColor(named: "cellColor")
        //firstNamePair.textColor = UIColor(named: "appColor")
        
        firstTypePairLabel.anchor(firstNamePairLabel.topAnchor, left: firstNamePairLabel.rightAnchor, bottom: nil, right: timeLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
        firstTypePairLabel.backgroundColor = UIColor(named: "cellColor")
        //firstTypePair.textColor = UIColor(named: "appColor")
        
        firstNameTeacherLabel.anchor(firstNamePairLabel.bottomAnchor, left: firstNamePairLabel.leftAnchor, bottom: nil, right: firstNamePairLabel.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
        firstNameTeacherLabel.backgroundColor = UIColor(named: "cellColor")
        //firstNameTeacher.textColor = UIColor(named: "appColor")
        
        firstAuditoriumLabel.anchor(firstNameTeacherLabel.topAnchor, left: firstTypePairLabel.leftAnchor, bottom: nil, right: firstTypePairLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
        firstAuditoriumLabel.backgroundColor = UIColor(named: "cellColor")
        //firstAuditorium.textColor = UIColor(named: "appColor")
        
        lineView.anchor(firstNameTeacherLabel.bottomAnchor, left: firstNameTeacherLabel.leftAnchor, bottom: nil, right: firstAuditoriumLabel.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        lineView.backgroundColor = #colorLiteral(red: 0.08299512416, green: 0.4790764451, blue: 0.9991850257, alpha: 1)
        
      secondNamePairLabel.anchor(lineView.bottomAnchor, left: lineView.leftAnchor, bottom: nil, right: firstNameTeacherLabel.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
        secondNamePairLabel.backgroundColor = UIColor(named: "cellColor")
        //secondNamePair.textColor = UIColor(named: "appColor")
        
        secondTypePairLabel.anchor(secondNamePairLabel.topAnchor, left: firstTypePairLabel.leftAnchor, bottom: nil, right: lineView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
        secondTypePairLabel.backgroundColor = UIColor(named: "cellColor")
        //secondTypePair.textColor = UIColor(named: "appColor")
        
        secondNameTeacherLabel.anchor(secondNamePairLabel.bottomAnchor, left: secondNamePairLabel.leftAnchor, bottom: nil, right: secondNamePairLabel.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
        secondNameTeacherLabel.backgroundColor = UIColor(named: "cellColor")
        //secondNameTeacher.textColor = UIColor(named: "appColor")
        
        secondAuditoriumLabel.anchor(secondNameTeacherLabel.topAnchor, left: secondTypePairLabel.leftAnchor, bottom: nil, right: secondTypePairLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
        secondAuditoriumLabel.backgroundColor = UIColor(named: "cellColor")
        //secondAuditorium.textColor = UIColor(named: "appColor")
    }
    
    public func configure(numberPair: Int, firstNamePair: String, firstAuditoriumPair: [String], firstNameTeacher: [LectureLocal], firstTypePair: String, secondNamePair: String, secondAuditoriumPair: [String], secondNameTeacher: [LectureLocal], secondTypePair: String) {
        
        switch numberPair {
          case 1:
            timeLabel.text = "8:30"
          case 2:
            timeLabel.text = "10:10"
          case 3:
            timeLabel.text = "11:50"
          case 4:
            timeLabel.text = "14:00"
          case 5:
            timeLabel.text = "15:40"
          case 6:
            timeLabel.text = "17:20"
          case 7:
            timeLabel.text = "19:00"
          default:
            timeLabel.text = ""
        }
        
        firstNamePairLabel.text = firstNamePair
        self.secondNamePairLabel.text = secondNamePair
        
        if !firstAuditoriumPair.isEmpty {
          firstAuditoriumLabel.text = firstAuditoriumPair[0]
        } else {
          firstAuditoriumLabel.text = ""
        }
        
        if !secondAuditoriumPair.isEmpty {
          secondAuditoriumLabel.text = secondAuditoriumPair[0]
        } else {
          secondAuditoriumLabel.text = ""
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
    
    internal override func awakeFromNib() {
        setupViews()
    }
}
