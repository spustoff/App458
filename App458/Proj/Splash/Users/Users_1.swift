//
//  Users_1.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct Users_1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {
        ZStack {
            
            Color("bg")
                .opacity(0.4)
                .ignoresSafeArea()
            
            Image("users_1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("Investments now,\nprofits for the future")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .semibold))
                            .multilineTextAlignment(.leading)
                        
                        Text("Start earning now")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.leading)
                    })

                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            Users_2(telegram: telegram, isTelegram: isTelegram)
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(width: 140, height: 45)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        })
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("bg").ignoresSafeArea())
            }
        }
    }
}

#Preview {
    Users_1(telegram: URL(string: "h")!, isTelegram: false)
}
