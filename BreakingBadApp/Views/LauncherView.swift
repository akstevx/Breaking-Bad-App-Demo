//
//  LauncherView.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import SwiftUI

struct LauncherView: View {
    var body: some View {
        ZStack{
            AppImages.splashBg.image()
                .resizable()
                .padding(.leading, -5)
            
                .ignoresSafeArea()
            VStack {

            }
            
        }
    }
}

struct LauncherView_Previews: PreviewProvider {
    static var previews: some View {
        LauncherView()
    }
}
