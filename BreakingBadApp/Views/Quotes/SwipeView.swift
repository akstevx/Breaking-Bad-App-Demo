//
//  SwipeView.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//


import SwiftUI

struct SwipeView: View {
    var slides: [Quote]
    @State private var offset: CGFloat = 0
    @State private var index = 0
    @State private var ignoreTimer = false

    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                VStack{
                    HStack(spacing: 0) {
                        ForEach(self.slides, id: \.self.quote_id) { slide in
                            QuoteSwipeItems(quote: slide)
                                .frame(width: geometry.size.width)

                        }
                    }.frame(width: geometry.size.width, alignment: .leading)
                        .offset(x: CGFloat(self.index) * -geometry.size.width, y: 0)
                        .animation(.spring())
                        .gesture(
                        DragGesture()
                                .onEnded({ value in
                                    if -value.predictedEndTranslation.width > geometry.size.width / 2, self.index < self.slides.count - 1 {
                                        self.index += 1
                                        self.ignoreTimer = true
                                    }
                                    if value.predictedEndTranslation.width > geometry.size.width / 2, self.index > 0 {
                                        self.index -= 1
                                        self.ignoreTimer = true
                                    }
                                })
                        )
                        .onReceive(self.timer) { _ in
                            if !ignoreTimer {
                                self.index = (self.index + 1) % self.slides.count
                            }
                        }
                    HStack{
                        PageIndicator(numPages: self.slides.count, currentPage: self.$index)
                            .padding(.horizontal)
                        Spacer()
                    }.padding(.horizontal)
                }
            }
        }.frame( height: 130)
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView(slides: [])
    }
}
