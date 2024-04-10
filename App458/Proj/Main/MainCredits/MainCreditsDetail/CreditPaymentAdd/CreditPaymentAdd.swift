//
//  CreditPaymentAdd.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct CreditPaymentAdd: View {
    
    @StateObject var viewModel: MainCreditsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 25) {
                    
                    ZStack {
                        
                        Text("Add Payment Schedule")
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
                                
                                viewModel.addPayment()
                                viewModel.fetchPayments()
                                
                                router.wrappedValue.dismiss()
                                
                                viewModel.payment_amount = ""
                                viewModel.payment_date = Date()
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 17, weight: .semibold))
                            })
                            .opacity(viewModel.payment_amount.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.payment_amount.isEmpty ? true : false)
                        }
                    }
                    .padding([.horizontal, .top])
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 25) {
                        
                        HStack {
                            
                            Text("Date payment")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                            
                            DatePicker("", selection: $viewModel.payment_date, displayedComponents: .date)
                                .labelsHidden()
                            
                            Spacer()
                        }
                        .padding()
                        .overlay (
                        
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("primary"), lineWidth: 1)
                        )
                        
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.payment_amount.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.payment_amount)
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
    CreditPaymentAdd(viewModel: MainCreditsViewModel())
}
