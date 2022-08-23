//
//  ContentView.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @State private var showLaunchScreen = true

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            ZStack{
                if showLaunchScreen{
                    launchScreenView
                } else {
                    HomeView(homeViewModel: homeViewModel)
                }
            }
        }
    }
    
    var launchScreenView: some View {
        LauncherView()
          .opacity(showLaunchScreen ? 1 : 0)
          .navigationBarTitle("")
          .navigationBarHidden(showLaunchScreen)
          .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.showLaunchScreen = false
                }
            }
          }
    }
}


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
