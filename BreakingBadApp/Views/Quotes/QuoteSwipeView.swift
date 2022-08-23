//
//  QuoteSwipeView.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import SwiftUI

struct QuoteSwipeView: View {
    var slides: [Quote]
    @State private var offset: CGFloat = 0
    @State private var index = 0
    @State private var ignoreTimer = false
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                ForEach(self.slides, id: \.self.id) { slide in
                    SwipeViewItem(slide: slide)
                        .frame(width: geometry.size.width)
                }
            }
        }
    }
}

struct QuoteSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteSwipeView(slides: [])
    }
}

struct Quote{
    var author: String
    var quote: String
}
