//
//  AppDelegate.swift
//  Shedule
//
//  Created by Игорь Сазонов on 21.02.2021.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    Thread.sleep(forTimeInterval: 1.5)
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()

    if UserDefaults.standard.bool(forKey: "IsGroupSelected") == true {
      let sheduleViewController = UIStoryboard(name: "Storyboard", bundle: .main).instantiateViewController(withIdentifier: "TabVC")
      window?.rootViewController = sheduleViewController
    } else {
      let institute = UIStoryboard(name: "Institute", bundle: .main).instantiateViewController(withIdentifier: "instituteVC")
      window?.rootViewController = institute
    }
    return true
  }
}

