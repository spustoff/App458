//
//  MainCreditsAdd.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct MainCreditsAdd: View {
    
    @StateObject var viewModel: MainCreditsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 25) {
                    
                    ZStack {
                        
                        Text("Add Credit")
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
                                
                                viewModel.addCredit()
                                viewModel.fetchCredits()
                                
                                router.wrappedValue.dismiss()
                                
                                viewModel.credit_name = ""
                                viewModel.credit_amount = ""
                                viewModel.credit_loan = ""
                                viewModel.credit_date = Date()
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 17, weight: .semibold))
                            })
                            .opacity(viewModel.credit_name.isEmpty || viewModel.credit_amount.isEmpty || viewModel.credit_loan.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.credit_name.isEmpty || viewModel.credit_amount.isEmpty || viewModel.credit_loan.isEmpty ? true : false)
                        }
                    }
                    .padding([.horizontal, .top])
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 25) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter name credit")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.credit_name.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.credit_name)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                        .padding()
                        .overlay (
                        
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("primary"), lineWidth: 1)
                        )
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.credit_amount.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.credit_amount)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .overlay (
                        
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("primary"), lineWidth: 1)
                        )
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter loan term")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.credit_loan.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.credit_loan)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                        .padding()
                        .overlay (
                        
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("primary"), lineWidth: 1)
                        )
                        
                        HStack {
                            
                            Text("Date of last payment")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                            
                            DatePicker("", selection: $viewModel.credit_date, displayedComponents: .date)
                                .labelsHidden()
                            
                            Spacer()
                        }
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
    MainCreditsAdd(viewModel: MainCreditsViewModel())
}
