//
//  MainView.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Welcome")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                HStack {
                    
                    NavigationLink(destination: {
                        
                        MainAttachments()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image("my_attachments")
                            .resizable()
                            .frame(width: 150, height: 160)
                    })
                    
                    NavigationLink(destination: {
                        
                        MainCredits()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image("my_credits")
                            .resizable()
                            .frame(width: 150, height: 160)
                    })
                }
                .padding(.top)
                
                NavigationLink(destination: {
                    
                    MainSettings()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Image("settings")
                        .resizable()
                        .frame(width: 300, height: 125)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    MainView()
}
