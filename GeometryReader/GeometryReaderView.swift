//  ContentView.swift
//  GeometryReader
//  Created by Sumit on 14/09/24.

import SwiftUI

struct GeometryReaderView: View {
    
    @State var YAxis_view1:CGFloat  = 0.0
    @State var YAxis_view2:CGFloat  = 0.0
    @State var view1_Conditions:Bool  = false
    @State var view2_Conditions:Bool  = false
    
    var body: some View {
        ZStack {
            Image("Bg_img")
                .resizable()
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                VStack {
                    HStack(spacing:130) {
                        Rectangle()
                            .fill(.cyan)
                            .cornerRadius(10)
                            .frame(width: proxy.size.width * 0.3, height:  proxy.size.height * 0.1)
                            .offset(y:view1_Conditions == true ? YAxis_view1 : 0)
                            .shadow(radius: 10)
                            .overlay(content: {
                                Button {
                                    YAxis_view1 = proxy.size.height * 0.5
                                    view1_Conditions.toggle()
                                } label: {
                                    Text("View 1")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .bold, design: .default))
                                }
                                .offset(y:view1_Conditions == true ? YAxis_view1 : 0)
                            })
                        Rectangle()
                            .fill(.gray)
                            .cornerRadius(10)
                            .frame(width: proxy.size.width * 0.3, height:  proxy.size.height * 0.1 )
                            .shadow(radius: 10)
                            .offset(y:view2_Conditions == true ? YAxis_view2 : 0)
                            .overlay(content: {
                                Button {
                                    YAxis_view2 = proxy.size.height * 0.5
                                    view2_Conditions.toggle()
                                } label: {
                                    Text("View 2")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .bold, design: .default))
                                }
                                .offset(y:view2_Conditions == true ? YAxis_view2 : 0)
                        })
                    }
                }
            }.padding()
         }
     }
 }

#Preview {
    GeometryReaderView()
}
