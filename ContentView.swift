//
//  ContentView.swift
//  Assignment1
//
//  Created by Raven G on 2024-09-27.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View{
        
        NavigationStack{
            
            ZStack {
                
                Circle()
                    .fill(Color.cyan.opacity(0.2))
                    .frame(width: 200, height: 200)
                    .offset(x: -150, y: -300)
                
                Circle()
                    .fill(Color.cyan.opacity(0.15))
                    .frame(width: 100, height: 100)
                    .offset(x: 120, y: -250)
                
                Circle()
                    .fill(Color.cyan.opacity(0.1))
                    .frame(width: 150, height: 150)
                    .offset(x: -100, y: 150)
                
                Circle()
                    .fill(Color.cyan.opacity(0.25))
                    .frame(width: 250, height: 250)
                    .offset(x: 100, y: 350)
                
                Circle()
                    .fill(Color.cyan.opacity(0.25))
                    .frame(width: 200, height: 150)
                    .offset(x: 120, y: -10)
                
                VStack(spacing: 40) {
                    
                    Text("Welcome to the Player Manager")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                     
                    
                    NavigationLink(destination: AddInfoView()) {
                        Text("Go to Add Data Page")
                            .font(.headline)
                            .frame(width: 250, height: 50)
                            .background(Color.cyan)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                    
                    NavigationLink(destination: ListInfoView()) {
                        Text("Go to List Data Page")
                            .font(.headline)
                            .frame(width: 250, height: 50)
                            .background(Color.cyan)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                }
                
                
            }
            
        }
        .accentColor(.black)
    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
