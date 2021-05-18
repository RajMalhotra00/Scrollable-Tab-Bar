//
//  Home.swift
//  Scrollable Tab Bar
//
//  Created by Raj Malhotra on 25.04.21.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        GeometryReader{proxy in
            
            let rect = proxy.frame(in: .global)
            
            ScrollableTabBar(tabs: tabs, rect: rect, offset: $offset) {
                
                HStack(spacing: 0){
                    
                    ForEach(image_URLs.indices, id: \.self){index in
                        
                        WebImage(url: URL(string: image_URLs[index]))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: rect.width)
                            .cornerRadius(0)
                            .overlay(Color.black.opacity(0.3))
                    }
                }
                .ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
        .overlay(
        //Tab Bar...
            TabBar(offset: $offset), alignment: .top
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var tabs = ["View1 ", "View2", "View3"]
