//
//  UrlImageView.swift
//  Splitcash
//
//  Created by Steven David on 22/06/2022.
//


import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    var placeHolderText: String
    var width:CGFloat?
    var height:CGFloat?
    var clipSides:Bool?
    var cornerRadius:CFloat?

    init(urlString: String?, placeHolderText:String, width:CGFloat? = 100, height:CGFloat? = 100, clipSides:Bool? = true, cornerRadius:CFloat? = 0) {
        urlImageModel = UrlImageModel(urlString: urlString)
        self.placeHolderText = placeHolderText
        self.width = width
        self.height = height
        self.clipSides = clipSides
        self.clipSides = clipSides
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        if urlImageModel.image != nil{
            if clipSides == true{
                Image(uiImage: urlImageModel.image!)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: width, height: height)
                    
            } else {
                Image(uiImage: urlImageModel.image!)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(CGFloat(cornerRadius ?? 0))
                    .frame(width: width, height: height)
            }
                
        } else {
            Image(uiImage: urlImageModel.image ?? UIImage(named: placeHolderText)!)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: width, height: height)
        }

    }
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil, placeHolderText: "" )
    }
}
