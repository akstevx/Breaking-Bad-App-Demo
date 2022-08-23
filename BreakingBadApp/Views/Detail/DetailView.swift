//
//  DetailView.swift
//  BreakingBadApp
//
//  Created by Steven David on 23/08/2022.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var detailViewModel:DetailViewModel
    let hieght: CGFloat = (UIScreen.screenHeight <= 667) ? 150 : 200
    let padding: CGFloat = (UIScreen.screenHeight <= 667) ? 100 : 220

    var body: some View {
        ZStack{
            AppColors.darkBg.color().ignoresSafeArea()
            characterImg

            VStack{
                    
                VStack{
                    if detailViewModel.detail != nil {
                        Spacer()
                        characterDetail
                            .padding(.top, padding)
                        
                        Spacer()
                        
                        if detailViewModel.showShimmer{
                            shimmerView
                        } else{
                            quotes
                        }
                        
                        Spacer()

                    }
                }

            }
            
        }.onAppear(perform: detailViewModel.getCharacterID)
    }
    
    
    var characterImg : some View{
        VStack{
            UrlImageView(urlString: detailViewModel.detail?.img! , placeHolderText: "content-bg", width: (detailViewModel.detail != nil) ? UIScreen.screenWidth: 200, height: (detailViewModel.detail != nil) ? UIScreen.screenHeight : 200, clipSides: false, cornerRadius: 8).ignoresSafeArea()
            
        }
    }
    
    var characterDetail: some View{
        ZStack{
            AppColors.systemDarkBase.color()
            
            VStack(spacing: 10){
                detailName
                
                detailNickName
                
                dob
                
                occupations
                
                status
            }
            
        }.frame(width: UIScreen.screenWidth - 20, height: 180)
        .cornerRadius(8)
        .padding(.vertical, 2)
    }

    var detailName: some View{
        HStack{
            Text("Name")
                .lineLimit(1)
                .regularSubStyle(AppColors.white70.color())

            
            Spacer()
            
            Text(detailViewModel.detail?.name ?? "")
                .frame(alignment: .trailing)
                .lineLimit(1)
                .regularMidStyle(AppColors.white.color())
            
        }.padding(.horizontal)
            .padding(.top)
    }
    
    var detailNickName: some View{
        HStack{
            Text("Nick name")
                .lineLimit(1)
                .regularSubStyle(AppColors.white70.color())
            
            Spacer()
            
            Text(detailViewModel.detail?.nickname ?? "")
                .frame(alignment: .trailing)
                .lineLimit(1)
                .regularMidStyle(AppColors.white.color())

            
        }.padding(.horizontal)
    }
    
    var dob: some View{
        HStack{
            Text("Date of Birth")
                .lineLimit(1)
                .regularSubStyle(AppColors.white70.color())
            
            Spacer()
            
            Text(detailViewModel.detail?.birthday ?? "")
                .frame(alignment: .trailing)
                .lineLimit(1)
                .regularMidStyle(AppColors.white.color())
            
        }.padding(.horizontal)
    }
    
    var occupations: some View{
        HStack{
            Text("Occupations")
                .lineLimit(1)
                .regularSubStyle(AppColors.white70.color())
            
            Spacer()
            
            VStack(alignment: .trailing){
                ForEach(detailViewModel.detail?.occupation ?? [], id: \.self){ occupation in
                    Text(occupation)
                        .frame(alignment: .trailing)
                        .lineLimit(1)
                        .captionStyle(AppColors.white.color())

                }
            }

        }.padding(.horizontal)
    }
    
    var status: some View{
        HStack{
            Text("Status")
                .lineLimit(1)
                .regularSubStyle(AppColors.white70.color())
            
            Spacer()
            
            Text(detailViewModel.detail?.status ?? "")
                .frame(alignment: .trailing)
                .lineLimit(1)
                .foregroundColor( (detailViewModel.detail?.status ?? "") == "Alive" ? AppColors.systemBlue.color() : AppColors.systemError.color())
                .regularSubStyle(AppColors.white.color())
            
        }.padding(.horizontal)
            .padding(.bottom)
    }
    
    var quotes: some View{
        VStack(alignment: .center, spacing: 10){
            ScrollView{
                ForEach(detailViewModel.quotes, id: \.self.quote_id){ quote in
                    QuoteSwipeItems(quote: quote)
                        .padding(.trailing, -15)
                        .frame(height: 90)
                }
            }
        }.frame(height: UIScreen.screenHeight*0.6)
        .padding(.top)
            .padding(.horizontal)
    }
    
    var shimmerView: some View{
        VStack{
            QuoteShimmerView()
            QuoteShimmerView()
            QuoteShimmerView()
            
            Spacer()
        }.frame(height: UIScreen.screenHeight*0.6)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(detailViewModel: DetailViewModel(id: 1))
    }
}
