//
//  ViewExtensions.swift
//  BreakingBadApp
//
//  Created by Steven David on 23/08/2022.
//

import SwiftUI

extension View {
    
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}
