//
//  MainCreditsDetail.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct MainCreditsDetail: View {
    
    let index: CreditModel
    
    @StateObject var viewModel: MainCreditsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 25) {
                    
                    ZStack {
                        
                        Text("My Attachments")
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
                        }
                    }
                    .padding([.horizontal, .top])
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        HStack {
                            
                            Text(index.name ?? "")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 21, weight: .semibold))
                            
                            Spacer()
                            
                            Text("$\(index.amount)")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 21, weight: .semibold))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text(index.loan_term ?? "")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Spacer()
                                
                                Text("Loan Term")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text((index.date ?? Date()).convertDate(format: "MMM d Y"))
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Spacer()
                                
                                Text("Date of last payment")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                        }
                        
                        HStack {
                            
                            Text("Payment Schedule")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Spacer()
                            
                            Button(action: {
                                
                                viewModel.isAddPayment = true
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 15, weight: .medium))
                            })
                        }
                        .padding(.vertical)
                        
                        if viewModel.credit_payments.isEmpty {
                            
                            VStack(alignment: .center, spacing: 15, content: {
                                
                                Image("empty2")
                                
                                Text("No any credit's payments")
                                    .foregroundColor(.black)
                                    .font(.system(size: 21, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                
                                Text("Add your first payment")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                            .padding(.vertical, 100)
                        } else {
                            
                            ForEach(viewModel.credit_payments, id: \.self) { index in
                            
                                HStack {
                                    
                                    Text("\((index.date ?? Date()).convertDate(format: "MMM d Y HH:mm"))")
                                        .foregroundColor(.black)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Text("$\(index.amount)")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            
            viewModel.fetchPayments()
        }
        .sheet(isPresented: $viewModel.isAddPayment, content: {
            
            CreditPaymentAdd(viewModel: viewModel)
        })
    }
}

//#Preview {
//    MainCreditsDetail(index: <#CardModel#>, viewModel: MainCreditsViewModel())
//}
