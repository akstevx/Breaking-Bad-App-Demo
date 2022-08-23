//
//  CharacterShimmerView.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import SwiftUI

struct CharacterShimmerView: View {
    var body: some View {
        ZStack{
            VStack{
                shimmerItem
                    .padding(10)
                shimmerItem
                    .padding(10)
                shimmerItem
                    .padding(10)
            }
        }
    }
    
    var shimmerItem: some View{
        VStack (alignment: .leading){

            HStack(){
                ShimmerView(color: AppColors.quantinary.color())
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                    .padding(.leading)
                
                VStack (alignment: .leading){
                    HStack{
                        
                        ShimmerView(color: AppColors.quantinary.color())
                            .frame(width: 120, height: 15)
                            .cornerRadius(30)
                        
                        Spacer()
                        
                        ShimmerView(color: AppColors.quantinary.color())
                            .frame(width: 100, height: 10)
                            .cornerRadius(30)
                    }
                    HStack{
                        
                        ShimmerView(color: AppColors.quantinary.color())
                            .frame(width: 170, height: 10)
                            .cornerRadius(30)
                        
                        Spacer()
                        
                        ShimmerView(color: AppColors.quantinary.color())
                            .frame(width: 50, height: 10)
                            .cornerRadius(30)
                    }
                    HStack{
                        
                        ShimmerView(color: AppColors.quantinary.color())
                            .frame(width: 100, height: 10)
                            .cornerRadius(50)
                        
                        Spacer()
                        
                        ShimmerView(color: AppColors.quantinary.color())
                            .frame(width: 70, height: 10)
                            .cornerRadius(50)
                    }
                }.padding()
                    
                    Spacer()
                    
                }
        }.frame(height: 100, alignment: .center)
        .background(AppColors.systemDarkElevated.color())
        .cornerRadius(10)
    }
}

struct CharacterShimmerView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterShimmerView()
    }
}
