//
//  MainAttachmentsAdd.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct MainAttachmentsAdd: View {
    
    @StateObject var viewModel: MainAttachmentsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 25) {
                    
                    ZStack {
                        
                        Text("Add Card")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                        
                        HStack {
                            
                            Button(action: {
                                
                                router.wrappedValue.dismiss()
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 10, weight: .medium))
                                    .frame(width: 23, height: 23)
                                    .background(Circle().fill(.gray.opacity(0.2)))
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                
                                viewModel.addCard()
                                viewModel.fetchCards()
                                
                                router.wrappedValue.dismiss()
                                
                                viewModel.card_number = ""
                                viewModel.card_amount = ""
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 17, weight: .semibold))
                            })
                            .opacity(viewModel.card_number.isEmpty || viewModel.card_amount.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.card_number.isEmpty || viewModel.card_amount.isEmpty ? true : false)
                        }
                    }
                    .padding([.horizontal, .top])
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 25) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter card number")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.card_number.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.card_number)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .overlay (
                        
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("primary"), lineWidth: 1)
                        )
                        
                        HStack {
                            
                            Text("Enter date expire of card")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                            
                            DatePicker("", selection: $viewModel.card_dateExpire, displayedComponents: .date)
                                .labelsHidden()
                            
                            Spacer()
                        }
                        .padding()
                        .overlay (
                        
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("primary"), lineWidth: 1)
                        )
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter amount on card")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.card_amount.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.card_amount)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .overlay (
                        
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("primary"), lineWidth: 1)
                        )
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    MainAttachmentsAdd(viewModel: MainAttachmentsViewModel())
}
