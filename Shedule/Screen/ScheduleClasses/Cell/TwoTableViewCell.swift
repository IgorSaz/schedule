//
//  TwoTableViewCell.swift
//  Shedule
//
//  Created by Игорь Сазонов on 08.05.2021.
//

import UIKit

class TwoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var basView: UIView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var firstNamePair: UILabel!
    @IBOutlet weak var firstTypePair: UILabel!
    @IBOutlet weak var firstNameTeacher: UILabel!
    @IBOutlet weak var firstAuditorium: UILabel!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var secondNamePair: UILabel!
    @IBOutlet weak var secondTypePair: UILabel!
    @IBOutlet weak var secondNameTeacher: UILabel!
    @IBOutlet weak var secondAuditorium: UILabel!
    
    func setupViews() {
        basView.anchor(contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 176)
        basView.backgroundColor = UIColor(named: "cellColor")
        basView.layer.cornerRadius = 20
        
//        time.anchor(basView.topAnchor, left: basView.leftAnchor, bottom: nil, right: basView.rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 20)
//        
//        firstNamePair.anchor(time.bottomAnchor, left: time.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
//        firstTypePair.anchor(firstNamePair.topAnchor, left: firstNamePair.rightAnchor, bottom: nil, right: time.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
//        firstNameTeacher.anchor(firstNamePair.bottomAnchor, left: firstNamePair.leftAnchor, bottom: nil, right: firstNamePair.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
//        firstAuditorium.anchor(firstNameTeacher.topAnchor, left: firstNameTeacher.rightAnchor, bottom: nil, right: firstTypePair.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
//        
//        //
//        line.anchor(firstNameTeacher.bottomAnchor, left: firstNameTeacher.leftAnchor, bottom: nil, right: firstAuditorium.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
//        line.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
//        
//        secondNamePair.anchor(line.bottomAnchor, left: line.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
//        secondTypePair.anchor(secondNamePair.topAnchor, left: secondNamePair.rightAnchor, bottom: nil, right: line.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
//        secondNameTeacher.anchor(secondNamePair.bottomAnchor, left: secondNamePair.leftAnchor, bottom: nil, right: secondNamePair.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
//        secondAuditorium.anchor(secondNameTeacher.topAnchor, left: secondNameTeacher.rightAnchor, bottom: nil, right: secondTypePair.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentView.frame.size.width/2, heightConstant: 20)
    }
}
