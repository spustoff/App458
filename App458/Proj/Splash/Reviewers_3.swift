//
//  Reviewers_3.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct Reviewers_3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("reviewers_3")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Track your loan debt")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.leading)
                    
                    Text("Create debts to\nalways remember them")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("bg"))
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
    Reviewers_3()
}
