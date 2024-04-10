//
//  Reviewers_1.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct Reviewers_1: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("reviewers_1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Convenient navigation\nsystem")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.leading)
                    
                    Text("Everything important is collected \non one screen")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("bg"))
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviewers_2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(width: 140, height: 45)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                    })
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    Reviewers_1()
}
