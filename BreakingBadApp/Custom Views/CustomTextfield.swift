//
//  CustomTextfield.swift
//  BreakingBadApp
//
//  Created by Steven David on 22/08/2022.
//

import Foundation
import SwiftUI
struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    var textContentType:UITextContentType? = .name
    var keyboardType:UIKeyboardType = .default
    var isSecure:Bool = false
    var leadingImage:Image? = nil
    var isDisbaled = false
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                if(leadingImage != nil){
                    placeholder
                        .padding(.leading)
                        .padding(.leading)
                }else{
                    placeholder
                }
                
            }
            if(isSecure){
                SecureField("", text: $text)
                    .textContentType(textContentType)
                    .keyboardType(keyboardType)
                    .disabled(isDisbaled)
            }else{
                if(leadingImage != nil){
                    HStack{
                        leadingImage
                        TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                            .textContentType(textContentType)
                            .keyboardType(keyboardType)
                            .disabled(isDisbaled)
                    }
                }else{
                    TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                        .textContentType(textContentType)
                        .keyboardType(keyboardType)
                        .disabled(isDisbaled)
                }
            }
        }
    }
    
}


struct CustomTextField: View{
    var placeholder: Text
    @Binding var text: String
    var textContentType:UITextContentType? = .name
    var keyboardType:UIKeyboardType = .default
    var isSecure:Bool = false
    var leadingImage:Image? = nil
    var isDisbaled = false
    
    var body: some View {
        VStack(alignment: .leading) {
            SuperTextField(
                placeholder: placeholder.foregroundColor(AppColors.altText.color()),
                text: $text,textContentType: textContentType,keyboardType: keyboardType,isSecure: isSecure,leadingImage: leadingImage,isDisbaled: isDisbaled
            )
                .padding(11)
                .foregroundColor(AppColors.altText.color())
                .font(.custom("Moderat-Regular", size: 16))
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(AppColors.systemDarkElevated.color()))
                .foregroundColor(.white)
                .accentColor(AppColors.systemError.color())

        }
    }
    
    enum FocusField: Hashable {
      case field
    }
}
