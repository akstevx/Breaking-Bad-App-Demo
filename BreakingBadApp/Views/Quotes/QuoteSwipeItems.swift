//
//  QuoteSwipeItems.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import SwiftUI

struct QuoteSwipeItems: View {
    var quote : Quote

    var body: some View {
        VStack{
            GeometryReader { geometry in
                VStack{
                    
                HStack{
                    Text(quote.author)
                        .foregroundColor(AppColors.white.color())
                        .font(.custom("Moderat-Medium", size: 15))
                        .padding(.horizontal)
                    
                    Spacer()
                    
                }.padding(.top, 10)
                    .padding(.leading, 10)
                    .padding(.bottom, 5)
                
                HStack{
                    Text("' "+quote.quote+" '")
                        .foregroundColor(AppColors.grey80.color())
                        .font(.custom("Moderat-Medium", size: 13))
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                }.padding(.leading, 10)

                Spacer()

            }.background(AppColors.systemDarkElevated.color())
                    .frame(width: geometry.size.width - 20, height: geometry.size.height)
                .cornerRadius(6)
            }
        }
        
    }
}

struct QuoteSwipeItems_Previews: PreviewProvider {
    static var previews: some View {
        QuoteSwipeItems(quote: Quote(quote_id: 1, quote: "I watched Jane die. I was there. And I watched her die. I watched her overdose and choke to death. I could have saved her. But I didn’t.", author: "Jesse Pinkman"))
    }
}
