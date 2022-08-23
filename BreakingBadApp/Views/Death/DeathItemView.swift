//
//  DeathItemView.swift
//  BreakingBadApp
//
//  Created by Steven David on 23/08/2022.
//

import SwiftUI

struct DeathItemView: View {
    var death: Death

    var body: some View {
        ZStack{
            AppColors.systemDarkBase.color()
            VStack{
                name
                
                lastWords
                
                otherInfo
            }
            
        }.cornerRadius(10)
        .frame(height: 120)
        .padding(.horizontal)
        
    }
    
    var name: some View{
        Text(death.death)
            .regular2BodyStyle(.white)
            .multilineTextAlignment(.center)
            .padding(5)
    }
    
    var lastWords: some View{
        VStack{
            Text("Last words:")
                .captionStyle(AppColors.altText.color())

            Text("' "+death.last_words+" '")
                .multilineTextAlignment(.center)
                .regularSubStyle(.white)
        }
    }
    
    var otherInfo: some View{
        HStack{
            Text("Killed by:")
                .captionStyle(AppColors.altText.color())
            Text(death.responsible)
                .regularSubStyle(AppColors.systemError.color())
            
            Spacer()
            
            Text("Death: ")
                .captionStyle(AppColors.white70.color())
            Text("S \(death.season), E \(death.episode)")
                .captionStyle(AppColors.white.color())
            
        }.padding(5)
            .padding(.horizontal)

    }

}

struct DeathItemView_Previews: PreviewProvider {
    static var previews: some View {
        DeathItemView(death: Death(death_id: 40, death: "Bodyguards of Gus Fring", cause: "Multiple gunshots.", responsible: "Walter White", last_words: "What, you got a problem with stairs?", season: 4, episode: 13, number_of_deaths: 2))
    }
}
