//
//  AppImages.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import Foundation
import SwiftUI

enum AppImages: String {
    case contentBackground = "content-bg"
    case avatar = "dummy-avatar"
    case splashBg = "splash-bg"
    case userIc = "user-ic"
    case sortIc = "sort-ic"
    case cancel = "cancel"
    case avartar = "avartar"
    case reload = "reload"

    func image() -> Image {
        Image(self.rawValue)
    }
    
    func uiImage() -> UIImage? {
        UIImage(named: self.rawValue)
    }
}
