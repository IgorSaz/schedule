//
//  NotInternetView.swift
//  Shedule
//
//  Created by Игорь Сазонов on 19.04.2021.
//


import UIKit

@IBDesignable
class NotInternetView: UIView {
  func loadViewFromNib(nibName: String) -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: nibName, bundle: bundle)
    return nib.instantiate(withOwner: self, options: nil).first! as! UIView
  }
}
