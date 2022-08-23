//
//  UserDefaultsManager.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import Foundation
import SwiftUI

struct UserDefaultsManager{
    var isUserFirstTime: String{
        get{
            return UserDefaults.standard.string(forKey: UserDefaultsManagerKeys.isUserFirstTime) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsManagerKeys.isUserFirstTime)
        }
    }

    var userName: Bool{
        get{
            return UserDefaults.standard.bool(forKey: UserDefaultsManagerKeys.userName)
        }

        set{
            UserDefaults.standard.set(newValue, forKey: UserDefaultsManagerKeys.userName)
        }
    }
}

struct UserDefaultsManagerKeys {
    static let isUserFirstTime = "isUserFirstTime"
    static let userName = "userName"

}
