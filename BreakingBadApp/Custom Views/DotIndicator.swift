//
//  DotIndicator.swift
//  Splitcash
//
//  Created by Bolu Okunaiya on 05/12/2021.
//

import SwiftUI

struct DotIndicator: View {
    let minScale: CGFloat = 1
    let maxScale: CGFloat = 1.1
    let minOpacity: Double = 0.6
    
    let pageIndex: Int
    @Binding var slectedPage: Int
    
    var body: some View {
        Button(action: {
            self.slectedPage = self.pageIndex
        }) {
            if slectedPage == pageIndex{
                Rectangle()
                    .scaleEffect(maxScale)
                    .animation(.spring())
                    .foregroundColor(.white)
                    .frame(width: 15, height: 5)
                    .cornerRadius(8)
            }else{
                Circle()
                    .scaleEffect(minScale)
                    .animation(.spring())
                    .foregroundColor(AppColors.white30.color())
            }

        }
        
    }
}

struct PageIndicator: View {
    private let spacing: CGFloat = 8
    private let diameter: CGFloat = 8
    let numPages: Int
    @Binding var selectedIndex: Int
    
    init(numPages: Int, currentPage: Binding<Int>) {
        self.numPages = numPages
        self._selectedIndex = currentPage
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: spacing) {
                ForEach((0..<numPages)) {
                    DotIndicator(
                        pageIndex: $0,
                        slectedPage: self.$selectedIndex
                    ).frame(
                        width: self.diameter,
                        height: self.diameter
                    )
                }
            }
        }
    }
}
