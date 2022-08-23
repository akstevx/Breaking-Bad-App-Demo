//
//  CharacterItemView.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import SwiftUI

struct CharacterItemView: View {
    var character: Character
    var body: some View {
        ZStack{
            AppColors.systemDarkElevated.color()
            HStack{
                UrlImageView(urlString: character.img, placeHolderText: "avartar", width: 45, height: 45).padding(.leading)
                
                VStack(alignment: .leading, spacing: 2){
                    Text(character.name)
                        .lineLimit(1)
                        .foregroundColor(AppColors.white.color())
                        .font(.custom("Moderat-Mediium", size: 14))
                    
                    Text("Category: \(character.category)")
                        .lineLimit(1)
                        .foregroundColor(AppColors.grey80.color())
                        .font(.custom("Moderat-Mediium", size: 12))
                    
                    Text("Nick name: \(character.nickname)")
                        .foregroundColor(AppColors.grey80.color())
                        .font(.custom("Moderat-Mediium", size: 12))
                }
                
                Spacer()

                VStack(alignment: .trailing , spacing: 2){
                    Text(character.birthday)
                        .foregroundColor(AppColors.white.color())
                        .font(.custom("Moderat-Mediium", size: 14))
                    
                    Text("Status")
                        .foregroundColor(AppColors.grey80.color())
                        .font(.custom("Moderat-Mediium", size: 12))
                    
                    Text(character.status)
                        .foregroundColor(character.status == "Alive" ? AppColors.systemBlue.color() : AppColors.systemError.color())
                        .font(.custom("Moderat-Mediium", size: 12))
                }.padding(.trailing)
            }
        }.frame(height: 90)
        .cornerRadius(6)
        .padding(.horizontal)
            .padding(.vertical, 2)
    }
}

struct CharacterItemView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterItemView(character: Character(char_id: dummyCharacter.char_id, name: dummyCharacter.name, nickname: dummyCharacter.nickname, status: dummyCharacter.status, portrayed: dummyCharacter.portrayed, category: dummyCharacter.category, birthday: dummyCharacter.birthday, img: dummyCharacter.img, better_call_saul_appearance: dummyCharacter.better_call_saul_appearance, occupation: dummyCharacter.occupation, appearance: dummyCharacter.appearance))
    }
}
