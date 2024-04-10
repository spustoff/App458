//
//  MainAttachmentsDetail.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct MainAttachmentsDetail: View {
    
    let index: CardModel
    
    @StateObject var viewModel: MainAttachmentsViewModel
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
                        
                        Image("card")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay (
                            
                                VStack(alignment: .leading) {
                                    
                                    VStack(alignment: .leading, spacing: 5, content: {
                                        
                                        Text("Current Balance")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text("$\(index.amount)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 30, weight: .semibold))
                                    })
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Text(index.card_number ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("\((index.date_expire ?? Date()).convertDate(format: "MMM d Y"))")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                }
                                    .padding()
                            )
                        
                        HStack {
                            
                            Text("Payment History")
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
                        
                        if viewModel.card_payments.isEmpty {
                            
                            VStack(alignment: .center, spacing: 15, content: {
                                
                                Image("empty2")
                                
                                Text("No any card's payments")
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
                            
                            ForEach(viewModel.card_payments, id: \.self) { index in
                            
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 4, content: {
                                        
                                        Text(index.name ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Text("\((index.date ?? Date()).convertDate(format: "MMM d Y HH:mm"))")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                    })
                                    
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
            
            CardPaymentAdd(viewModel: viewModel)
        })
    }
}

//#Preview {
//    MainAttachmentsDetail()
//}
