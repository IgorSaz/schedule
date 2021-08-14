//
//  Institutes.swift
//  Shedule
//
//  Created by Игорь Сазонов on 16.03.2021.
//

import Foundation

struct Institute: Codable {
  let IITiUTS: ListGroups
  let IYAEiP: ListGroups?
  let YUI: ListGroups?
  let MI: ListGroups?
  let IRiIB: ListGroups?
  let IFEiU: ListGroups?
  let PI: ListGroups?
  let IONiMO: ListGroups?
  let GPI: ListGroups?
  let TSFKiS: ListGroups?
  let IRG: ListGroups?
  let IINTI: ListGroups?
  let MK: ListGroups?
  
  enum CodingKeys: String, CodingKey {
    case IITiUTS = "Институт информационных технологий и управления в технических системах"
    case IYAEiP = "Институт ядерной энергии и промышленности"
    case YUI = "Юридический институт"
    case MI = "Морской институт"
    case IRiIB = "Институт радиоэлектроники и информационной безопасности"
    case IFEiU = "Институт финансов, экономики и управления"
    case PI = "Политехнический институт"
    case IONiMO = "Институт общественных наук и международных отношений"
    case GPI = "Гуманитарно-педагогический институт"
    case TSFKiS = "Центр Физическая культура и спорт"
    case IRG = "Институт развития города"
    case IINTI = "Институт ИНТИ"
    case MK = "Морской колледж"
  }
}
