//
//  AppColors.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.

import UIKit
import SwiftUI

enum AppColors {
    case altText //grey60
    case systemBlue //system-blue
    case systemCaution // system-caution
    case systemDarkBase // system-dark-base
    case systemDarkElevated //system-dark-elevated
    case darkBg //system-dark
    case systemError //system-error
    case white //white
    case white30 //white30
    case grey80 // grey80
    case quantinary //Quantinary
    case white70// white70
}

extension AppColors: RawRepresentable {
    typealias RawValue = UIColor

    init?(rawValue: RawValue) {
        switch rawValue {
        default: return nil // makes no sense to match a UIColor object
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .altText: return UIColor(named: "grey60")!
        case .systemBlue: return UIColor(named: "system-blue")!
        case .systemCaution: return UIColor(named: "system-caution")!
        case .systemDarkBase: return UIColor(named: "system-dark-base")!
        case .systemDarkElevated: return UIColor(named: "system-dark-elevated")!
        case .darkBg: return UIColor(named: "system-dark")!
        case .white: return UIColor(named: "white")!
        case .white30: return UIColor(named: "white30")!
        case .systemError: return UIColor(named: "system-error")!
        case .grey80: return UIColor(named: "grey80")!
        case .quantinary: return UIColor(named: "Quantinary")!
        case .white70: return UIColor(named: "white70")!

        }
    }
    
    
    func color() -> Color {
        self.rawValue.color()
    }

    func uiColor() -> UIColor {
        self.rawValue
    }
        
}
