//
//  Users_3.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct Users_3: View {
    
    let telegram: URL
    
    var body: some View {
        ZStack {
            
            Color("bg2")
                .opacity(0.3)
                .ignoresSafeArea()
            
            Image("users_3")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("Join and earn")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .semibold))
                            .multilineTextAlignment(.leading)
                        
                        Text("Join our Telegram group\ntrade with our team")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.leading)
                    })

                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            UIApplication.shared.open(telegram)
                            
                        }, label: {
                            
                            Text("Join")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(width: 140, height: 45)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color(red: 0/255, green: 163/255, blue: 255/255)))
                        })
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("bg2").ignoresSafeArea())
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Users_4()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                    })
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Users_3(telegram: URL(string: "h")!)
}
