//
//  Reviewers_2.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct Reviewers_2: View {
    var body: some View {
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("reviewers_2")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Create your own cards\nwith attachments")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.leading)
                    
                    Text("Track each attachment")
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
                        
                        Reviewers_3()
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
    Reviewers_2()
}
