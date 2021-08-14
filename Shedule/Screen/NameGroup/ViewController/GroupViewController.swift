//
//  GroupViewController.swift
//  Shedule
//
//  Created by Игорь Сазонов on 16.03.2021.
//

import UIKit

class GroupViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var searchNameGroup: UISearchBar!
  var nameInstitut: String?
  private var mass = [String]()
  private let parseNameGroup = ParserNameGroup()
  
  var institute = Institute(IITiUTS: ListGroups(name: "", groups: []), IYAEiP: ListGroups(name: "", groups: []), YUI: ListGroups(name: "", groups: []), MI: ListGroups(name: "", groups: []), IRiIB: ListGroups(name: "", groups: []), IFEiU: ListGroups(name: "", groups: []), PI: ListGroups(name: "", groups: []), IONiMO: ListGroups(name: "", groups: []), GPI: ListGroups(name: "", groups: []), TSFKiS: ListGroups(name: "", groups: []), IRG: ListGroups(name: "", groups: []), IINTI: ListGroups(name: "", groups: []), MK: ListGroups(name: "", groups: []))
    
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationController?.navigationBar.shadowImage = UIImage()
    
    tableView.dataSource = self
    tableView.delegate = self
    self.navigationController?.navigationBar.prefersLargeTitles = true
    self.title = "Выберите группу"
    parseNameGroup.parseGroup { (instituteResponse) in // parse
      self.institute = instituteResponse
      self.mass = self.returnMassGroup(institute: instituteResponse)
      self.tableView.reloadData()
    } errorHandler: { (error) in
      self.showToast(message: "Отсутствует подключение к Интернету")
      // написать Allert Controller
    }
    self.tableView.reloadData()
  }
  
  /*
  private func initSearchController() {
    searchNameGroup.loadViewIfNeeded()
    searchNameGroup.searchResultsUpdater = self
    searchNameGroup.obscuresBackgroundDuringPresentation = false
    searchNameGroup.searchBar.returnKeyType = UIReturnKeyType.done
    definesPresentationContext = true
    
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    searchController.searchBar.delegate = self
  }*/
  
  private func showToast(message: String) {
    let toastLabel = UILabel()
    toastLabel.textColor = UIColor(named: "NotInternetText")
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10
    toastLabel.clipsToBounds = true
    toastLabel.text = message
    toastLabel.backgroundColor = UIColor(named: "NotInternet")
    toastLabel.textAlignment = .center
    view.addSubview(toastLabel)
    
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
  }
  
  private func returnMassGroup(institute: Institute) -> [String] {
    switch nameInstitut {
      case "Институт информационных технологий и управления в технических системах":
        return institute.IITiUTS.groups
      case "Институт ядерной энергии и промышленности":
        return institute.IYAEiP?.groups ?? ["IYAEiP_1","IYAEiP_2"]
      case "Юридический институт":
        return institute.YUI?.groups ?? ["YUI_1","YUI_2"]
      case "Морской институт":
        return institute.MI?.groups ?? ["MI_1","MI_2"]
      case "Институт радиоэлектроники и информационной безопасности":
        return institute.IRiIB?.groups ?? ["IRiIB_1", "IRiIB_2"]
      case "Институт финансов, экономики и управления":
        return institute.IFEiU?.groups ?? ["IFEiU_1","IFEiU_2"]
      case "Политехнический институт":
        return institute.PI?.groups ?? ["PI_1", "PI_2"]
      case "Институт общественных наук и международных отношений":
        return institute.IONiMO?.groups ?? ["IONiMO_1", "IONiMO_2"]
      case "Гуманитарно-педагогический институт":
        return institute.GPI?.groups ?? ["GPI_1", "GPI_2"]
      case "Центр Физическая культура и спорт":
        return institute.TSFKiS?.groups ?? ["TSFKiS_1", "TSFKiS_2"]
      case "Институт развития города":
        return institute.IRG?.groups ?? ["IRG_1", "IRG_2"]
      case "Институт ИНТИ":
        return institute.IINTI?.groups ?? ["IINTI_1", "IINTI_2"]
      case "Морской колледж":
        return institute.MK?.groups ?? ["MK_1","MK_2"]
      default:
        mass = ["Группы"]
        return mass
    }
  }
}

extension GroupViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mass.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
    cell.textLabel?.text = mass[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    UserDefaults.standard.set(true, forKey: "IsGroupSelected")
    let group = mass[indexPath.row]
    UserDefaults.standard.set(group, forKey: "group")
    let viewController = UIStoryboard.init(name: "Storyboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabVC")
    viewController.modalPresentationStyle = .fullScreen
    present(viewController, animated: false, completion: nil)
    
  }
}
/*
extension GroupViewController: UISearchBarDelegate, UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    //let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
    let searchText = searchBar.text!
    
  }
} */
