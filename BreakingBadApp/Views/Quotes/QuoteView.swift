//
//  QuoteView.swift
//  BreakingBadApp
//
//  Created by Steven David on 23/08/2022.
//

import SwiftUI

struct QuoteView: View {
    @EnvironmentObject var quoteViewModel:QuoteViewModel
    var onDismiss: () -> Void
    var onClick: (Quote) -> Void

    @State var searchString = ""
    
    var body: some View {
        ZStack(alignment: .top){
            AppColors.darkBg.color().ignoresSafeArea()

            VStack{
                header
                
                if quoteViewModel.randomQoutes.count < 3 {
                    shimmerView
                } else{
                    quotes
                        .padding()
                }
                
            }
        }.onTapGesture {
            self.endTextEditing()
        }
        
    }
    
    var header: some View{
        HStack{
            CustomTextField(placeholder: Text("Search Author"), text: $quoteViewModel.searchString)
                .padding(.trailing)
                
            Spacer()
            
            Button(action: {
                onDismiss()
            }, label: {
                AppImages.cancel.image()
                    .resizable()
                    .frame(width: 25, height: 25)
            })
            
        }.padding(.top)
            .padding(.horizontal)
    }
    
    var quotes: some View{
        VStack(alignment: .center, spacing: 10){
            VStack{
                randomQuotes

            Text("Top Breaking Bad Quotes")
                .regularBodyStyle(AppColors.white.color())
                .padding()
            }

            ScrollView( showsIndicators: false){
                if quoteViewModel.isSearching{
                    ForEach((quoteViewModel.searchList), id: \.self.quote_id) { quote in
                        Button(action: {
                            onQuoteClicked(quote: quote)
                        }, label: {
                            QuoteSwipeItems(quote: quote)
                                .padding(.trailing, -15)
                                .frame(height: 100)
                        })

                    }.padding(.bottom)
                    
                }  else{
                    ForEach((quoteViewModel.quoteList), id: \.self.quote_id) { quote in
                        Button(action: {
                            onQuoteClicked(quote: quote)

                        }, label: {
                            QuoteSwipeItems(quote: quote)
                                .padding(.trailing, -15)
                                .frame(height: 100)
                        })
                    }.padding(.bottom)
                }
                
            }.frame(height: UIScreen.screenHeight * 0.55)
        }
    }
    
    var randomQuotes: some View{
        VStack(alignment: .leading){
            SwipeView(slides: quoteViewModel.getRandomQuotes())
        }.padding(.horizontal)
    }
    
    var shimmerView: some View{
        VStack{
            QuoteShimmerView()
            QuoteShimmerView()
            QuoteShimmerView()
        }
    }
    
    func onQuoteClicked(quote: Quote){
        onDismiss()
        onClick(quote)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView( onDismiss: {}, onClick: {_ in })
    }
}
