//
//  SettingsViewController.swift
//  Shedule
//
//  Created by Игорь Сазонов on 17.03.2021.
//

import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  
  let massSetting = ["Сменить группу","Обратная связь","О приложении"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.prefersLargeTitles = true
    self.title = "Настройки"
    tableView.dataSource = self
    tableView.delegate = self
  }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return massSetting.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
    cell.textLabel?.text = massSetting[indexPath.row]
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch massSetting[indexPath.row] {
      case "Сменить группу":
        let institute = UIStoryboard(name: "Institute", bundle: .main).instantiateViewController(withIdentifier: "institute")
        self.navigationController?.pushViewController(institute, animated: true)
      default:
        print("")
    }
  }
}
