//
//  QuoteShimmerView.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import SwiftUI

struct QuoteShimmerView: View {
    var body: some View {
        ZStack{
            VStack{
                shimmerItem
                    .padding()
            }
        }
        
    }
    
    var shimmerItem: some View{
        VStack (alignment: .leading, spacing: 10){

            HStack{

                VStack (alignment: .leading){
                    ShimmerView(color: AppColors.quantinary.color())
                        .frame(width: 120, height: 15)
                        .cornerRadius(30)
                        .padding(.bottom, 5)
                    
                    ShimmerView(color: AppColors.quantinary.color())
                        .frame(height: 10)
                        .cornerRadius(30)
                    
                    
                    ShimmerView(color: AppColors.quantinary.color())
                        .frame(height: 10)
                        .cornerRadius(30)
                    
                    ShimmerView(color: AppColors.quantinary.color())
                        .frame(height: 10)
                        .cornerRadius(30)
                    
                }.padding()
                    
                    Spacer()
                    
                }
        }.frame(height: 120, alignment: .center)
        .background(AppColors.systemDarkElevated.color())
        .cornerRadius(10)
    }
}

struct QuoteShimmerView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteShimmerView()
    }
}
