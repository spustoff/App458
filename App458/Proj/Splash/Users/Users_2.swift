//
//  Users_2.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI
import StoreKit

struct Users_2: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {
        ZStack {
            
            Color("bg")
                .opacity(0.4)
                .ignoresSafeArea()
            
            Image("users_2")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("Rate our app\nin the AppStore")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .semibold))
                            .multilineTextAlignment(.leading)
                        
                        Text("Help make the app even better")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.leading)
                    })

                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            if isTelegram == true {
                                
                                Users_3(telegram: telegram)
                                    .navigationBarBackButtonHidden()
                                
                            } else if isTelegram == false {
                                
                                Users_4()
                                    .navigationBarBackButtonHidden()
                            }
                            
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Users_2(telegram: URL(string: "h")!, isTelegram: false)
}
