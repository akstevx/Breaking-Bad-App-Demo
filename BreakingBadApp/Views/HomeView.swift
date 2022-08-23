//
//  HomeView.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel:HomeViewModel
    @State var screenCoverCase: ScreenCoverCase = .Quote

    var body: some View {
        ZStack(alignment: .top){
            NavigationLink(destination: DetailView(detailViewModel: .init(id: homeViewModel.currentId)), isActive: $homeViewModel.openDetailView, label: {EmptyView()})
            AppImages.contentBackground.image()
                .resizable()
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                
                header

                CustomTextField(placeholder: Text("Search Anything"), text: $homeViewModel.searchString)
                    .padding()
                
                if homeViewModel.randomQoutes.count < 3 {
                    QuoteShimmerView()
                } else{
                    randoms
                }

                actionButtons
                
                characterList
                
                Spacer()
            }
            
            
        }.onTapGesture {
            self.endTextEditing()
        }
        .fullScreenCover(isPresented: $homeViewModel.toggleFullScreen, content: {
            homeViewModel.presentSheet(screenCoverCase: screenCoverCase)
        })
    }
   
    var header: some View{
        VStack{
            HStack{
                AppImages.userIc.image()
                
                VStack(alignment: .leading){
                    Text("Welcome,")
                        .caption2Style(AppColors.altText.color())
                    
                    Text("SingKing")
                        .regular2BodyStyle(AppColors.white.color())
                }
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    AppImages.sortIc.image()
                })

            }.padding(.horizontal)
        }
    }
    
    
    var randoms: some View{
        VStack(alignment: .leading){
            Text("Random Thoughts 💭")
                .regularBodyStyle(AppColors.white.color())
            
            SwipeView(slides: homeViewModel.getQuotes())
            
        }.padding(.horizontal)
            .padding(.top)
    }
    
    var actionButtons: some View{
        HStack{
            Button(action: {
                screenCoverCase = .Quote
                homeViewModel.toogleSheet()
            }, label: {
                quote.padding(.horizontal, 5)
            })
            
            Button(action: {
                screenCoverCase = .Death
                homeViewModel.toogleSheet()
            }, label: {
                death.padding(.horizontal, 5)
            })
        }.padding(.horizontal)
    }

    var quote: some View{
        ZStack{
            AppColors.systemError.color()
            HStack{
                Spacer()
                Text("Quotes")
                    .regular2BodyStyle(AppColors.white.color())

                Spacer()
            }
        }.cornerRadius(6)
            .frame(height: 40)
    }
    
    var death: some View{
        ZStack{
            AppColors.systemDarkBase.color()
            HStack{
                Spacer()
                Text("Deaths")
                    .regular2BodyStyle(AppColors.white.color())

                Spacer()
            }
        }.cornerRadius(6)
            .frame(height: 40)
    }
    
    var characterList: some View{
        ScrollView(showsIndicators: false){

            if homeViewModel.showShimmer{
                CharacterShimmerView()
                    .padding(.bottom)
            }else{
                if  homeViewModel.isSearching {
                    ForEach((homeViewModel.searchList), id: \.self.char_id) { character in
                        Button(action: {
                            homeViewModel.moveToDetailView(id: character.char_id)

                        }, label: {
                            CharacterItemView(character: character)
                        })
                    }.padding(.bottom)
                }  else{
                    ForEach((homeViewModel.characterList), id: \.self.char_id) { character in
                        
                        Button(action: {
                            homeViewModel.moveToDetailView(id: character.char_id)
                        }, label: {
                            CharacterItemView(character: character)
                        })
                    }.padding(.bottom)
                }
                
                LazyVStack{
                    ScrollViewReader { value in
                        if homeViewModel.showProgress{
                            ProgressView()
                                .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                                .onAppear(perform: {
                                    print("CALLING API...")
                                    homeViewModel.getCharacters()
                                    value.scrollTo(homeViewModel.characterList.count)
                            })
                        }
                    }
                }.padding()
            }
        }.frame(height: UIScreen.screenHeight * 0.5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel())
    }
}

enum ScreenCoverCase{
    case Quote
    case Death
}
