//
//  OddWeek.swift
//  Shedule
//
//  Created by Игорь Сазонов on 22.02.2021.
//

import UIKit
import Network
import RealmSwift
import Realm

var scheduleLocal = ScheduleLocal(odd: WeekLocal(monday: [], tuesday: [], wednesday: [], thursday: [], friday: [], saturday: []), even: WeekLocal(monday: [], tuesday: [], wednesday: [], thursday: [], friday: [], saturday: []))

class OddWeakViewController: UIViewController {
  
  @IBOutlet private var dayWeekSegmented: UISegmentedControl!
  @IBOutlet private var tableView: UITableView!
  @IBOutlet var tabBar: UIView!
  @IBOutlet var notInternetView: UIView!
  
  private let parseShedule = ParserShedule()
  private var counter = 0
  
  let realm = try! Realm()
  var oddShedule: WeekLocal!
  var evenShedule: WeekLocal!
  
  var weekOdd: WeekLocal!
  
  let weekRM = WeekRM()
  let weekRM_2 = WeekRM()
    
  var shedule: [[PairLocal]] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(Realm.Configuration.defaultConfiguration.fileURL!)
    setupVC()
    
    let scheduleRM = realm.objects(ScheduleRM.self)
    
    parseShedule.parseGroup { (sheduleResponse) in // parse
      scheduleGroup = sheduleResponse
      print(scheduleGroup)
      
      if scheduleRM.isEmpty == true {
        let schedule = self.returnSchedule(shedule: scheduleGroup, isEmpty: false)
        self.writeDBRM(scheduleRM: schedule)
      } else if scheduleRM.first?.isEmpty == false {
        try! self.realm.write {
          self.realm.delete(scheduleRM)
          let week = self.realm.objects(WeekRM.self)
          let pair = self.realm.objects(PairRM.self)
          let lecture = self.realm.objects(LectureRM.self)
          self.realm.delete(week)
          self.realm.delete(pair)
          self.realm.delete(lecture)
        }
        let schedule = self.returnSchedule(shedule: scheduleGroup, isEmpty: false)
        self.writeDBRM(scheduleRM: schedule)
      }
      
      scheduleLocal = self.initializationSheduleLocal(scheduleRM: scheduleRM.first) // инициализация моделей данными из реалма
      
      dayShedule = scheduleLocal.odd.monday
      self.oddShedule = scheduleLocal.odd
      self.evenShedule = scheduleLocal.even
      self.shedule = self.returnMassPair(massPair: dayShedule)
      self.weekOdd = scheduleLocal.odd
      self.tableView.reloadData()
    } errorHandler: { (error) in
      // показываем расписание из бд, выводим вьюху на 3 сек о том что интернета нет
      scheduleLocal = self.initializationSheduleLocal(scheduleRM: scheduleRM.first) // инициализация моделей данными из реалма
      dayShedule = scheduleLocal.odd.monday
      self.oddShedule = scheduleLocal.odd
      self.evenShedule = scheduleLocal.even
      self.shedule = self.returnMassPair(massPair: dayShedule)
      self.weekOdd = scheduleLocal.odd
      // написать Allert Controller
      self.showToast(message: "Отсутствует подключение к Интернету")
      self.tableView.reloadData()
    }
    
    //scheduleLocal = initializationSheduleLocal(scheduleRM: scheduleRM.first) // инициализация моделей данными из реалма
    
    dayShedule = scheduleLocal.odd.monday
    print(dayShedule)
    shedule = self.returnMassPair(massPair: scheduleLocal.odd.monday)
    self.tableView.reloadData()
  }
  
  private func initializationSheduleLocal(scheduleRM: ScheduleRM?) -> ScheduleLocal {
    
    // odd
    
    let mondayRM = scheduleRM?.odd?.monday
    let tuesdayRM = scheduleRM?.odd?.tuesday
    let wednesdayRM = scheduleRM?.odd?.wednesday
    let thursdayRM = scheduleRM?.odd?.thursday
    let fridayRM = scheduleRM?.odd?.friday
    let saturdayRM = scheduleRM?.odd?.saturday
    
    
    let mondayOdd = initialization_second(listPair: mondayRM)
    let tuesdayOdd = initialization_second(listPair: tuesdayRM)
    let wednesdayOdd = initialization_second(listPair: wednesdayRM)
    let thursdayOdd = initialization_second(listPair: thursdayRM)
    let fridayOdd = initialization_second(listPair: fridayRM)
    let saturdayOdd = initialization_second(listPair: saturdayRM)
    
    // even
    
    let mondayRM_2 = scheduleRM?.even?.monday
    let tuesdayRM_2 = scheduleRM?.even?.tuesday
    let wednesdayRM_2 = scheduleRM?.even?.wednesday
    let thursdayRM_2 = scheduleRM?.even?.thursday
    let fridayRM_2 = scheduleRM?.even?.friday
    let saturdayRM_2 = scheduleRM?.even?.saturday
    
    let mondayEven = initialization_second(listPair: mondayRM_2)
    let tuesdayEven = initialization_second(listPair: tuesdayRM_2)
    let wednesdayEven = initialization_second(listPair: wednesdayRM_2)
    let thursdayEven = initialization_second(listPair: thursdayRM_2)
    let fridayEven = initialization_second(listPair: fridayRM_2)
    let saturdayEven = initialization_second(listPair: saturdayRM_2)
    
    let scheduleLocal = ScheduleLocal(odd: WeekLocal(monday: mondayOdd, tuesday: tuesdayOdd, wednesday: wednesdayOdd, thursday: thursdayOdd, friday: fridayOdd, saturday: saturdayOdd), even: WeekLocal(monday: mondayEven, tuesday: tuesdayEven, wednesday: wednesdayEven, thursday: thursdayEven, friday: fridayEven, saturday: saturdayEven))
    return scheduleLocal
  }
  
  private func writeDBRM(scheduleRM: ScheduleRM) {
    try! self.realm.write {
      self.realm.add(scheduleRM)
    }
  }
  
  private func returnSchedule(shedule: Schedule, isEmpty: Bool) -> ScheduleRM {
    
    let mondayOdd = shedule.odd.monday
    let tuesdayOdd = shedule.odd.tuesday
    let wednesdayOdd = shedule.odd.wednesday
    let thursdayOdd = shedule.odd.thursday
    let fridayOdd = shedule.odd.friday
    let saturdayOdd = shedule.odd.saturday
    
    let mondayEven = shedule.even.monday
    let tuesdayEven = shedule.even.tuesday
    let wednesdayEven = shedule.even.wednesday
    let thursdayEven = shedule.even.thursday
    let fridayEven = shedule.even.friday
    let saturdayEven = shedule.even.saturday
    
    let mondayRM = weekRM.monday
    let tuesdayRM = weekRM.tuesday
    let wednesdayRM = weekRM.wednesday
    let thursdayRM = weekRM.thursday
    let fridayRM = weekRM.friday
    let saturdayRM = weekRM.saturday
    
    let oddMondayRM = initialization(listPair: mondayRM, massPair: mondayOdd)
    
    let oddTuesdayRM = initialization(listPair: tuesdayRM, massPair: tuesdayOdd)
    
    let oddWednesdayRM = initialization(listPair: wednesdayRM, massPair: wednesdayOdd)
    
    let oddThursdayRM = initialization(listPair: thursdayRM, massPair: thursdayOdd)
    
    let oddFridayRM = initialization(listPair: fridayRM, massPair: fridayOdd)
    
    let oddSaturdayRM = initialization(listPair: saturdayRM, massPair: saturdayOdd)
    
    // even
    
    let mondayRM_2 = weekRM_2.monday
    let tuesdayRM_2 = weekRM_2.tuesday
    let wednesdayRM_2 = weekRM_2.wednesday
    let thursdayRM_2 = weekRM_2.thursday
    let fridayRM_2 = weekRM_2.friday
    let saturdayRM_2 = weekRM_2.saturday
    
    let evenMondayRM = initialization(listPair: mondayRM_2, massPair: mondayEven)
    
    let evenTuesdayRM = initialization(listPair: tuesdayRM_2, massPair: tuesdayEven)
    
    let evenWednesdayRM = initialization(listPair: wednesdayRM_2, massPair: wednesdayEven)
    
    let evenThursdayRM = initialization(listPair: thursdayRM_2, massPair: thursdayEven)
    
    let evenFridayRM = initialization(listPair: fridayRM_2, massPair: fridayEven)
    
    let evenSaturdayRM = initialization(listPair: saturdayRM_2, massPair: saturdayEven)
      
    let scheduleRM = ScheduleRM(odd: WeekRM(monday: oddMondayRM, tuesday: oddTuesdayRM, wednesday: oddWednesdayRM, thursday: oddThursdayRM, friday: oddFridayRM, saturday: oddSaturdayRM), even: WeekRM(monday: evenMondayRM, tuesday: evenTuesdayRM, wednesday: evenWednesdayRM, thursday: evenThursdayRM, friday: evenFridayRM, saturday: evenSaturdayRM), isEmpty: isEmpty)
  
    return scheduleRM
  }
  
  
  private func initialization(listPair: List<PairRM>, massPair: [Pair]) -> List<PairRM> {
    if massPair.count != 0 {
      for index in 0...massPair.count-1 {
        let pair = PairRM()
        listPair.append(pair)
        pair.pair = massPair[index].pair
        pair.subject = massPair[index].subject
        for room in massPair[index].rooms {
          pair.rooms.append(room)
        }
          
        for lecturer in massPair[index].lecturers {
          let lectureRM = LectureRM()
          lectureRM.fullName = lecturer.fullName ?? ""
          pair.lecturers.append(lectureRM)
        }
        pair.type = massPair[index].type
      }
    }
    return listPair
  }
  
  private func initialization_second(listPair: List<PairRM>?) -> [PairLocal] {
    var mass = [PairLocal]()
    
    if listPair != nil {
      if listPair!.count != 0 {
        for index in 0...listPair!.count-1 {
          let pair = PairLocal()
          pair.pair = listPair![index].pair
          pair.subject = listPair![index].subject
          for room in listPair![index].rooms {
            pair.rooms.append(room)
          }
          
          for lecturer in listPair![index].lecturers {
            print(lecturer.fullName)
            let lectur = LectureLocal()
            lectur.fullName = lecturer.fullName
            pair.lecturers.append(lectur)
          }
          pair.type = listPair![index].type
          mass.append(pair)
        }
      }
    }
    return mass
  }
    
  private func setupVC() {
    setupSegmentedControl()
    setupNavigationItem()
    setupTableView()
    setupSwipe()
  }
  
  private func setupTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    let nib = UINib(nibName: "SheduleTableViewCell", bundle: Bundle.main)
    tableView.register(nib, forCellReuseIdentifier: "Cell")
    let secondNib = UINib(nibName: "TwoPairTableViewCell", bundle: Bundle.main)
    tableView.register(secondNib, forCellReuseIdentifier: "twoPairCell")
    let notPairNib = UINib(nibName: "NotPairTableViewCell", bundle: Bundle.main)
    tableView.register(notPairNib, forCellReuseIdentifier: "notPairCell")
    tableView.separatorStyle = .none
    tableView.backgroundColor = UIColor(named: "not")
    
    let second = UINib(nibName: "TwoTableViewCell", bundle: Bundle.main)
    tableView.register(second, forCellReuseIdentifier: "FCell")
    
    //notInternetView.layer.cornerRadius = 10
  }
  
  private func showToast(message: String) {
    /*
    let notInternetView = NotInternetView()
    let internetView = notInternetView.loadViewFromNib(nibName: "NotInternetView")
    //internetView.frame = CGRect(x: <#T##Double#>, y: <#T##Double#>, width: <#T##Double#>, height: <#T##Double#>)
  

    notInternetView.addSubview(internetView)
    
    internetView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    internetView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    internetView.translatesAutoresizingMaskIntoConstraints = false
    
    
    view.addSubview(notInternetView)
    notInternetView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    notInternetView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -40).isActive = true
    
    notInternetView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    notInternetView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    notInternetView.translatesAutoresizingMaskIntoConstraints = false
    
    UIView.animate(withDuration: 4.0, delay: 3.0, options: .curveEaseIn, animations: {
      notInternetView.alpha = 0.0
    }) { (isCompleted) in
      notInternetView.removeFromSuperview()
    }
     */
  
    // view
    /*
    let attionView = UIView()
    attionView.backgroundColor = #colorLiteral(red: 0.1819700599, green: 0.1820426881, blue: 0.1868236065, alpha: 1)
    attionView.layer.cornerRadius = 10
    attionView.clipsToBounds = true
    */
    // label
    
    let toastLabel = UILabel()//(frame: CGRect(x: self.view.frame.width/2 - 75, y: self.view.frame.height - 100, width: self.view.frame.width - 30 , height: 40))
    toastLabel.textColor = UIColor(named: "NotInternetText")
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10
    toastLabel.clipsToBounds = true
    toastLabel.text = message
    toastLabel.backgroundColor = UIColor(named: "NotInternet")
    toastLabel.textAlignment = .center
    //#colorLiteral(red: 0.1819700599, green: 0.1820426881, blue: 0.1868236065, alpha: 1)
    view.addSubview(toastLabel)
    
    // icon
    
    
    
    // constraint
    
    toastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    toastLabel.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -30).isActive = true
    toastLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
    toastLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    toastLabel.translatesAutoresizingMaskIntoConstraints = false
    
    UIView.animate(withDuration: 4.0, delay: 3.0, options: .curveEaseIn, animations: {
      toastLabel.alpha = 0.0
    }) { (isCompleted) in
      toastLabel.removeFromSuperview()
    }
    
    /*
    notInternet.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    notInternet.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -30).isActive = true
    notInternet.widthAnchor.constraint(equalToConstant: 350).isActive = true
    notInternet.heightAnchor.constraint(equalToConstant: 50).isActive = true
    notInternet.translatesAutoresizingMaskIntoConstraints = false
    
    
    // animate
    
    UIView.animate(withDuration: 4.0, delay: 3.0, options: .curveEaseIn, animations: {
      notInternet.alpha = 0.0
    }) { (isCompleted) in
      notInternet.removeFromSuperview()
    }
 */
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
          dayShedule = scheduleLocal.odd.monday
          shedule = returnMassPair(massPair: dayShedule)
        case 1:
          dayShedule = scheduleLocal.odd.tuesday
          shedule = returnMassPair(massPair: dayShedule)
        case 2:
          dayShedule = scheduleLocal.odd.wednesday
          shedule = returnMassPair(massPair: dayShedule)
        case 3:
          dayShedule = scheduleLocal.odd.thursday
          shedule = returnMassPair(massPair: dayShedule)
        case 4:
          dayShedule = scheduleLocal.odd.friday
          shedule = returnMassPair(massPair: dayShedule)
        case 5:
          dayShedule = scheduleLocal.odd.saturday
          shedule = returnMassPair(massPair: dayShedule)
        default:
          dayShedule = []
      }
      tableView.isScrollEnabled = true
      tableView.reloadData()
    }
  }
  
  private func setupSegmentedControl() {
    dayWeekSegmented.selectedSegmentIndex = counter
    if #available(iOS 13.0, *) {
      dayWeekSegmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
      dayWeekSegmented.selectedSegmentTintColor = #colorLiteral(red: 0.08235294118, green: 0.4784313725, blue: 1, alpha: 1)
    } else {
      dayWeekSegmented.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      dayWeekSegmented.tintColor = #colorLiteral(red: 0.08235294118, green: 0.4784313725, blue: 1, alpha: 1)
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
    self.navigationController?.navigationBar.topItem?.title = UserDefaults.standard.string(forKey: "group") ?? "" // name group
    self.navigationController?.navigationBar.prefersLargeTitles = false
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
  
  @IBAction private func tapSegmented(_ sender: UISegmentedControl) {
    counter = dayWeekSegmented.selectedSegmentIndex
    switch dayWeekSegmented.selectedSegmentIndex {
      case 0:
        dayShedule = scheduleLocal.odd.monday
        shedule = returnMassPair(massPair: dayShedule)
      case 1:
        dayShedule = scheduleLocal.odd.tuesday
        shedule = returnMassPair(massPair: dayShedule)
      case 2:
        dayShedule = scheduleLocal.odd.wednesday
        shedule = returnMassPair(massPair: dayShedule)
      case 3:
        dayShedule = scheduleLocal.odd.thursday
        shedule = returnMassPair(massPair: dayShedule)
      case 4:
        dayShedule = scheduleLocal.odd.friday
        shedule = returnMassPair(massPair: dayShedule)
      case 5:
        dayShedule = scheduleLocal.odd.saturday
        shedule = returnMassPair(massPair: dayShedule)
      default:
        dayShedule = []
    }
    tableView.reloadData()
  }
}

extension OddWeakViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dayShedule.count != 0 ? shedule.count : 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if dayShedule.count != 0 {
        print(shedule.count)
      if shedule[indexPath.row].count == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SheduleTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.configure(numberPair: shedule[indexPath.row][0].pair, namePair: shedule[indexPath.row][0].subject, auditoriumPair: shedule[indexPath.row][0].rooms, nameTeacher: shedule[indexPath.row][0].lecturers, typePair: shedule[indexPath.row][0].type)
        return cell
      } else {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "twoPairCell", for: indexPath) as! TwoPairTableViewCell
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.configure(numberPair: shedule[indexPath.row][0].pair, firstNamePair: shedule[indexPath.row][0].subject, firstAuditoriumPair: shedule[indexPath.row][0].rooms, firstNameTeacher: shedule[indexPath.row][0].lecturers, firstTypePair: shedule[indexPath.row][0].type, secondNamePair: shedule[indexPath.row][1].subject, secondAuditoriumPair: shedule[indexPath.row][1].rooms, secondNameTeacher: shedule[indexPath.row][1].lecturers, secondTypePair: shedule[indexPath.row][1].type)
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "FCell", for: indexPath) as! TwoTableViewCell // twoPairCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.configure(numberPair: shedule[indexPath.row][0].pair, firstNamePair: shedule[indexPath.row][0].subject, firstAuditoriumPair: shedule[indexPath.row][0].rooms, firstNameTeacher: shedule[indexPath.row][0].lecturers, firstTypePair: shedule[indexPath.row][0].type, secondNamePair: shedule[indexPath.row][1].subject, secondAuditoriumPair: shedule[indexPath.row][1].rooms, secondNameTeacher: shedule[indexPath.row][1].lecturers, secondTypePair: shedule[indexPath.row][1].type)
        return cell
        
      }
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "notPairCell", for: indexPath) as! NotPairTableViewCell
      cell.selectionStyle = UITableViewCell.SelectionStyle.none
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if shedule[indexPath.row].count > 1 {
      let viewController = UIStoryboard.init(name: "Detail", bundle: Bundle.main).instantiateViewController(withIdentifier: "secondDetailVC")
        //self.navigationController?.pushViewController(viewController, animated: true)
    } else {
      let viewController = UIStoryboard.init(name: "Detail", bundle: Bundle.main).instantiateViewController(withIdentifier: "firstDetailVC") as! FirstDetailViewController
      viewController.pair = shedule[indexPath.row]
      self.navigationController?.pushViewController(viewController, animated: true)
    }
  }
}
