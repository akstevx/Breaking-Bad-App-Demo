//
//  RandomDeathView.swift
//  BreakingBadApp
//
//  Created by Steven David on 23/08/2022.
//

import SwiftUI

struct RandomDeathView: View {
    var randomDeath: RandomDeath

    var body: some View {
        ZStack{
            AppColors.systemDarkBase.color()
            VStack{
                personal

                Divider()
                    .foregroundColor(AppColors.systemDarkBase.color())
                    .padding(.horizontal)
                
                VStack(spacing: 10){
                    causeOfDeath
                    lastWords
                    appearance
                }.padding(.vertical, 5)
            }
        }.cornerRadius(10)
        .frame(height: 200)
        .padding(.horizontal)

    }
    
    var personal: some View{
        HStack{
            UrlImageView(urlString: randomDeath.img, placeHolderText: "avartar", width: 65, height: 65).padding(.leading)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5){
                Text(randomDeath.death)
                    .regular2BodyStyle(AppColors.white.color())

                HStack{
                    Text("Killed by: ")
                        .captionStyle(AppColors.white70.color())
                    Text(randomDeath.responsible)
                        .regularSubStyle(AppColors.systemError.color())
                }
                
                HStack{
                    Text("Died in: ")
                        .captionStyle(AppColors.white70.color())
                    Text("Season \(randomDeath.season), Episode \(randomDeath.episode)")
                        .regularSubStyle(AppColors.white.color())
                }
            }.padding(.trailing)
            
        }.padding(.vertical, 5)
    }
    
    var causeOfDeath: some View{
        HStack{
            Text("Cause of Death")
                .regularSubStyle(AppColors.white70.color())
            
            Spacer()
            
            Text(randomDeath.cause)
                .regularSubStyle(AppColors.white.color())
                
        }.padding(.horizontal)
    }
    
    var lastWords: some View{
        HStack{
            Text("Last words:")
                .regularSubStyle(AppColors.white70.color())
            
            Spacer()
            VStack{
                Text(randomDeath.last_words)
                    .regularSubStyle(AppColors.white.color())
                    .multilineTextAlignment(.trailing)
            }
                
        }.padding(.horizontal)
    }
    
    var appearance: some View{
        HStack{
            Text("appearances:")
                .regularSubStyle(AppColors.white70.color())
            
            Text("\(randomDeath.appearance.count)")
                .regularSubStyle(AppColors.white.color())
                
        }.padding(.horizontal)
    }
}

struct RandomDeathView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDeathView(randomDeath: RandomDeath(death_id: death.death_id, death: death.death, cause: death.cause, responsible: death.responsible, last_words: death.last_words, season: death.season, episode: death.episode, occupation: death.occupation, img: death.img, nickname: death.nickname, appearance: death.appearance))
    }
}
