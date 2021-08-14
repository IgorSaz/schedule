//
//  FirstDetailViewController.swift
//  Shedule
//
//  Created by Игорь Сазонов on 20.04.2021.
//

import UIKit

class FirstDetailViewController: UIViewController {
  
  @IBOutlet var timePairLabel: UILabel!
  @IBOutlet var nameTypePairLabel: UILabel!
  @IBOutlet var tableView: UITableView!
  public var pair: [PairLocal]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupTableView()
    switch pair[0].pair {
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
        timePairLabel.text = "--:--"
    }
    
    var type = ""
    
    switch pair[0].type { // type Pair
    case "practics":
      type = "ПЗ"
    case "lecture":
      type = "Л"
    case "lab":
      type = "ЛЗ"
    default:
      type = ""
    }
    
    nameTypePairLabel.text = pair[0].subject + "(\(type))"
    tableView.reloadData()
  }
  
  private func setupTableView() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension FirstDetailViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pair[0].lecturers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "firstDetailCell", for: indexPath)
    if pair[0].lecturers.count == pair[0].rooms.count {
      cell.textLabel?.text = pair[0].lecturers[indexPath.row].fullName + " " + pair[0].rooms[indexPath.row]
    } else {
      print(pair[0].lecturers.count)
      print(pair[0].rooms.count)
      cell.textLabel?.text = pair[0].lecturers[indexPath.row].fullName + " " + pair[0].rooms[0]
    }
    return cell
  }
}
