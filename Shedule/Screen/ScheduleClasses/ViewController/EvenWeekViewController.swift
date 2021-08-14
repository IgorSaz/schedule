//
//  EvenWeekViewController.swift
//  Shedule
//
//  Created by Игорь Сазонов on 02.03.2021.
//

import UIKit

var scheduleGroup = Schedule(odd: Week(monday: [], tuesday: [], wednesday: [], thursday: [], friday: [], saturday: []), even: Week(monday: [], tuesday: [], wednesday: [], thursday: [], friday: [], saturday: []))
var sheduleLocal = ScheduleLocal(odd: WeekLocal(monday: [], tuesday: [], wednesday: [], thursday: [], friday: [], saturday: []), even: WeekLocal(monday: [], tuesday: [], wednesday: [], thursday: [], friday: [], saturday: []))
var dayShedule: [PairLocal] = []
//var shedule: [[PairLocal]] = []

class EvenWeekViewController: UIViewController {
  
  @IBOutlet private var dayWeekSegmented: UISegmentedControl!
  @IBOutlet private var tableView: UITableView!
  
  private let parseShedule = ParserShedule()
  private var counter = 0
  var shedule: [[PairLocal]] = []
 
  override func viewDidLoad() {
    super.viewDidLoad()
    setupVC()
    
    dayShedule = scheduleLocal.even.monday
    print(dayShedule)
    shedule = self.returnMassPair(massPair: dayShedule)
    self.tableView.reloadData()
  }
  
  private func setupVC() {
    setupSegmentedControl()
    setupNavigationItem()
    setupTableView()
    setupSwipe()
  }
  
  private func setupSwipe() {
    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handLegesture(gesture:)))
    swipeLeft.direction = .left
    self.view.addGestureRecognizer(swipeLeft)
    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handLegesture(gesture:)))
    swipeRight.direction = .right
    self.view.addGestureRecognizer(swipeRight)
  }
  
  @objc private func handLegesture(gesture: UISwipeGestureRecognizer) {
    tableView.isScrollEnabled = false
    if counter>=0 && counter < 6 {
      if gesture.direction == UISwipeGestureRecognizer.Direction.right {
        if counter != 0 {
          counter = counter - 1
          dayWeekSegmented.selectedSegmentIndex = counter
        }
      }
      if gesture.direction == UISwipeGestureRecognizer.Direction.left {
        if counter != 5 {
          counter = counter + 1
          dayWeekSegmented.selectedSegmentIndex = counter
        }
      }
      switch dayWeekSegmented.selectedSegmentIndex {
        case 0:
          dayShedule = scheduleLocal.even.monday
          shedule = returnMassPair(massPair: dayShedule)
        case 1:
          dayShedule = scheduleLocal.even.tuesday
          shedule = returnMassPair(massPair: dayShedule)
        case 2:
          dayShedule = scheduleLocal.even.wednesday
          shedule = returnMassPair(massPair: dayShedule)
        case 3:
          dayShedule = scheduleLocal.even.thursday
          shedule = returnMassPair(massPair: dayShedule)
        case 4:
          dayShedule = scheduleLocal.even.friday
          shedule = returnMassPair(massPair: dayShedule)
        case 5:
          dayShedule = scheduleLocal.even.saturday
          shedule = returnMassPair(massPair: dayShedule)
          print(shedule)
        default:
          dayShedule = []
      }
      tableView.isScrollEnabled = true
      tableView.reloadData()
    }
  }
  
  private func setupNavigationItem() {
    if #available(iOS 13.0, *) {
      navigationController?.navigationBar.isTranslucent = true
    } else {
      navigationController?.navigationBar.isTranslucent = true
    }
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.topItem?.title = UserDefaults.standard.string(forKey: "group") ?? ""
    self.navigationController?.navigationBar.prefersLargeTitles = false // name group
  }
  
  private func setupTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    let nib = UINib(nibName: "SheduleTableViewCell", bundle: Bundle.main)
    tableView.register(nib, forCellReuseIdentifier: "Cell")
    //let secondNib = UINib(nibName: "TwoPairTableViewCell", bundle: Bundle.main)
    //tableView.register(secondNib, forCellReuseIdentifier: "twoPairCell")
    let notPairNib = UINib(nibName: "NotPairTableViewCell", bundle: Bundle.main)
    tableView.register(notPairNib, forCellReuseIdentifier: "notPairCell")
    tableView.separatorStyle = .none
    tableView.backgroundColor = UIColor(named: "bacgroundColor")
    
    let second = UINib(nibName: "TwoTableViewCell", bundle: Bundle.main)
    tableView.register(second, forCellReuseIdentifier: "FCell")
  }
  
  private func setupSegmentedControl() {
    if #available(iOS 13.0, *) {
      dayWeekSegmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
      dayWeekSegmented.selectedSegmentTintColor = #colorLiteral(red: 0.08299512416, green: 0.4790764451, blue: 0.9991850257, alpha: 1)
    } else {
      dayWeekSegmented.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      dayWeekSegmented.tintColor = #colorLiteral(red: 0.08299512416, green: 0.4790764451, blue: 0.9991850257, alpha: 1)
    }
  }
  
  private func de(pairs: [Pair]) -> Int {
    for pair in pairs {
        if pair.subject.contains("ВОЕННО-УЧЕБНЫЙ ЦЕНТР") {
            return 1
        } else {
            return pairs.count
        }
    }
    return 0
  }
  
  private func returnMassPair(massPair: [PairLocal]) -> [[PairLocal]] {
    var mass: [PairLocal] = []
    var massMass: [[PairLocal]] = []
    
    for index in 0 ..< massPair.count {
      if index < massPair.count - 1 {
        if massPair[index].pair == massPair[index+1].pair {
          mass.append(massPair[index])
          mass.append(massPair[index+1])
          massMass.append(mass)
        } else {
          if index != 0 {
            if massPair[index].pair != massPair[index-1].pair {
              mass.append(massPair[index])
              massMass.append(mass)
            }
          } else {
            mass.append(massPair[index])
            massMass.append(mass)
          }
        }
        mass = []
      } else {
        if index != 0 {
          if massPair[index].pair != massPair[index-1].pair {
            mass.append(massPair[index])
            massMass.append(mass)
          }
        } else {
          mass.append(massPair[index])
          massMass.append(mass)
        }
      }
    }
    return massMass
  }
  
  @IBAction func tapSegmented(_ sender: UISegmentedControl) {
    switch dayWeekSegmented.selectedSegmentIndex {
      case 0:
        dayShedule = scheduleLocal.even.monday
        shedule = returnMassPair(massPair: dayShedule)
      case 1:
        dayShedule = scheduleLocal.even.tuesday
        shedule = returnMassPair(massPair: dayShedule)
      case 2:
        dayShedule = scheduleLocal.even.wednesday
        shedule = returnMassPair(massPair: dayShedule)
      case 3:
        dayShedule = scheduleLocal.even.thursday
        shedule = returnMassPair(massPair: dayShedule)
      case 4:
        dayShedule = scheduleLocal.even.friday
        shedule = returnMassPair(massPair: dayShedule)
      case 5:
        dayShedule = scheduleLocal.even.saturday
        shedule = returnMassPair(massPair: dayShedule)
        print(shedule)
      default:
        dayShedule = []
    }
    tableView.reloadData()
  }
}

extension EvenWeekViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dayShedule.count != 0 ? shedule.count : 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if dayShedule.count != 0 {
      if shedule[indexPath.row].count == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SheduleTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.configure(numberPair: shedule[indexPath.row][0].pair, namePair: shedule[indexPath.row][0].subject, auditoriumPair: shedule[indexPath.row][0].rooms, nameTeacher: shedule[indexPath.row][0].lecturers, typePair: shedule[indexPath.row][0].type)
        return cell
      } else {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "twoPairCell", for: indexPath) as! TwoPairTableViewCell
        cell.configure(numberPair: shedule[indexPath.row][0].pair, firstNamePair: shedule[indexPath.row][0].subject, firstAuditoriumPair: shedule[indexPath.row][0].rooms, firstNameTeacher: shedule[indexPath.row][0].lecturers, firstTypePair: shedule[indexPath.row][0].type, secondNamePair: shedule[indexPath.row][1].subject, secondAuditoriumPair: shedule[indexPath.row][1].rooms, secondNameTeacher: shedule[indexPath.row][1].lecturers, secondTypePair: shedule[indexPath.row][1].type)*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "FCell", for: indexPath) as! TwoTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.setupViews()
        return cell
      }
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "notPairCell", for: indexPath) as! NotPairTableViewCell
      cell.selectionStyle = UITableViewCell.SelectionStyle.none
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(shedule[indexPath.row].count)
    if shedule[indexPath.row].count > 1 {
      let viewController = UIStoryboard.init(name: "Detail", bundle: Bundle.main).instantiateViewController(withIdentifier: "secondDetailVC")
      self.navigationController?.pushViewController(viewController, animated: true)
    } else {
      let viewController = UIStoryboard.init(name: "Detail", bundle: Bundle.main).instantiateViewController(withIdentifier: "firstDetailVC") as! FirstDetailViewController
      viewController.pair = shedule[indexPath.row]
      self.navigationController?.pushViewController(viewController, animated: true)
    }
  }
}
