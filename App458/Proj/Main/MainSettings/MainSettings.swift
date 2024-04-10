//
//  MainSettings.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI
import StoreKit

struct MainSettings: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    
                    Spacer()
                }
                .padding([.horizontal, .top])
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(alignment: .center, spacing: 20, content: {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Rate Us")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .medium))
                        })
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: DataManager().usagePolicy) else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(alignment: .center, spacing: 20, content: {
                            
                            Image(systemName: "doc.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Usage Policy")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .medium))
                        })
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                    })
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteAllData()
                        
                    }, label: {
                        
                        VStack(alignment: .center, spacing: 20, content: {
                            
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Reset Progress")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .medium))
                        })
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                    })
                })
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    MainSettings()
}
