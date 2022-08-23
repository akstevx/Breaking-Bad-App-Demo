//
//  TextStyles.swift
//  BreakingBadApp
//
//  Created by Steven David on 23/08/2022.
//

import Foundation
import SwiftUI


extension View{
    
    public func caption2Style(_ color: Color) -> some View {
        return self.modifier(Caption2Style()).foregroundColor(color)
    }
    
    public func captionStyle(_ color: Color) -> some View {
        return self.modifier(CaptionStyle()).foregroundColor(color)
    }
    
    public func regularSubStyle(_ color: Color) -> some View {
        return self.modifier(RegularSubStyle()).foregroundColor(color)
    }
    
    public func regularMidStyle(_ color: Color) -> some View {
        return self.modifier(RegularMidStyle()).foregroundColor(color)
    }

    public func regular2BodyStyle(_ color: Color) -> some View {
        return self.modifier(Regular2BodyStyle()).foregroundColor(color)
    }
    
    public func regularBodyStyle(_ color: Color) -> some View {
        return self.modifier(RegularBodyStyle()).foregroundColor(color)
    }
    
}

struct Caption2Style: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Moderat-Regular", size: 12))
    }
}

struct CaptionStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Moderat-Regular", size: 13))
    }
}

struct RegularSubStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Moderat-Regular", size: 14))
    }
}

struct RegularMidStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Moderat-Regular", size: 15))
    }
}

struct Regular2BodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Moderat-Regular", size: 16))
    }
}


struct RegularBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Moderat-Regular", size: 18))
    }
}



