//
//  MainAttachments.swift
//  App458
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct MainAttachments: View {
    
    @StateObject var viewModel = MainAttachmentsViewModel()
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
                        
                        viewModel.isAddCard = true
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16, weight: .medium))
                    })
                }
                .padding([.horizontal, .top])
                
                Text("My Attachments")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack (spacing: 20) {
                    
                    HStack {
                        
                        VStack(alignment: .center, spacing: 4, content: {
                            
                            Text("$\(viewModel.cards.map(\.amount).reduce(0, +))")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 23, weight: .semibold))
                            
                            Text("Total Amount")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 4, content: {
                            
                            Text("$\(viewModel.cards.count)")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 23, weight: .semibold))
                            
                            Text("Quantity Card")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                    }
                    
                    Button(action: {
                        
                        viewModel.isAddCard = true
                        
                    }, label: {
                        
                        Text("Add Card")
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
                
                if viewModel.cards.isEmpty {
                    
                    VStack(alignment: .center, spacing: 15, content: {
                        
                        Image("empty2")
                        
                        Text("Create your own cards\nwith attachments")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Track each attachment")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.cards, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedCard = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
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
                                })
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchCards()
        }
        .sheet(isPresented: $viewModel.isAddCard, content: {
            
            MainAttachmentsAdd(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.selectedCard {
                
                MainAttachmentsDetail(index: index, viewModel: viewModel)
            }
        })
    }
}

#Preview {
    MainAttachments()
}
