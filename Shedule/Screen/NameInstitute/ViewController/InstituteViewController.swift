//
//  InstituteViewController.swift
//  Shedule
//
//  Created by Игорь Сазонов on 15.03.2021.
//

import UIKit

class InstituteViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  private func setupTableView() {
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.prefersLargeTitles = true
    self.title = "Выберите институт"
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension InstituteViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return massNameInstitute.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "instituteCell", for: indexPath)
    cell.textLabel?.text = massNameInstitute[indexPath.row]
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let groupViewController = UIStoryboard.init(name: "Group", bundle: Bundle.main).instantiateViewController(withIdentifier: "GroupVC") as! GroupViewController
    groupViewController.nameInstitut = massNameInstitute[indexPath.row]
    //present(groupViewController, animated: true, completion: nil)
    self.navigationController?.pushViewController(groupViewController, animated: true)
  }
}
