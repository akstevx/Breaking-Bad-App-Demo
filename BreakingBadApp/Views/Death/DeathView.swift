//
//  DeathView.swift
//  BreakingBadApp
//
//  Created by Steven David on 23/08/2022.
//

import SwiftUI

struct DeathView: View {
    @EnvironmentObject var deathViewModel:DeathViewModel
    var onDismiss: () -> Void

    var body: some View {
        ZStack(alignment: .top){
            AppColors.darkBg.color().ignoresSafeArea()
            VStack{
                close
                                
                if deathViewModel.randomDeath != nil {
                    RandomDeathView(randomDeath: deathViewModel.randomDeath!)
                        .padding(.vertical, 20)
                }else{
                    CharacterShimmerView()
                }
                
                if deathViewModel.deadCharacterList != nil {
                    deadCharacters
                }
            }
        }
    }
    
    var close: some View{
        HStack{
            Spacer()
            
            Button(action: {
                onDismiss()
            }, label: {
                AppImages.cancel.image()
                    .resizable()
                    .frame(width: 25, height: 25)
            })
            
        }.padding()
    }
    
    
    var deadCharacters: some View{
        VStack(spacing: 10){
            ScrollView{
                ForEach(deathViewModel.deadCharacterList ?? [], id: \.self.death_id){ deadCharacter in
                    DeathItemView(death: deadCharacter)
                }
            }
        }.frame(height: UIScreen.screenHeight*0.5)
    }
    
    
}

struct DeathView_Previews: PreviewProvider {
    static var previews: some View {
        DeathView(onDismiss: {})
    }
}
