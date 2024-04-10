//
//  Users_4.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI
import OneSignalFramework

struct Users_4: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        ZStack {
            
            Color("bg")
                .opacity(0.4)
                .ignoresSafeArea()
            
            Image("users_4")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("Don’t miss anything")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .semibold))
                            .multilineTextAlignment(.leading)
                        
                        Text("Don’t miss the most\nuseful information")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.leading)
                    })

                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            OneSignal.Notifications.requestPermission({ accepted in
                              print("User accepted notifications: \(accepted)")
                                status = true
                            }, fallbackToSettings: true)
                            
                        }, label: {
                            
                            Text("Enable Notifications")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(width: 180, height: 45)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        })
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("bg").ignoresSafeArea())
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
    Users_4()
}
