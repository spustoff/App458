//
//  MainCredits.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct MainCredits: View {
    
    @StateObject var viewModel = MainCreditsViewModel()
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
                    
                    Button(action: {
                        
                        viewModel.isAddCredit = true
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16, weight: .medium))
                    })
                }
                .padding([.horizontal, .top])
                
                Text("My Credits")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Button(action: {
                    
                    viewModel.isChart = true
                    
                }, label: {
                    
                    HStack {
                        
                        Image("eurusd")
                        
                        Text("EUR/USD")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                    .padding(.horizontal)
                })
                
                VStack (spacing: 20) {
                    
                    VStack(alignment: .center, spacing: 4, content: {
                        
                        Text("$\(viewModel.credits.map(\.amount).reduce(0, +))")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 23, weight: .semibold))
                        
                        Text("Total Amount")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                    })
                    
                    Button(action: {
                        
                        viewModel.isAddCredit = true
                        
                    }, label: {
                        
                        Text("Add Credit")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                .padding([.horizontal])
                
                if viewModel.credits.isEmpty {
                    
                    VStack(alignment: .center, spacing: 15, content: {
                        
                        Image("empty2")
                        
                        Text("Track your loan debt")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Create debts to\nalways remember them")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.credits, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedCredit = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 10, content: {
                                            
                                            Text(index.name ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 17, weight: .medium))
                                            
                                            Text("Arrears: $\(index.amount)")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                        })
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                                })
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchCredits()
        }
        .sheet(isPresented: $viewModel.isChart, content: {
            
            MainCreditsGraph()
        })
        .sheet(isPresented: $viewModel.isAddCredit, content: {
            
            MainCreditsAdd(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.selectedCredit {
                
                MainCreditsDetail(index: index, viewModel: viewModel)
            }
        })
    }
}

#Preview {
    MainCredits()
}
