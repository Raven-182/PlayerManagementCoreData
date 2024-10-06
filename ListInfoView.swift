//
//  ShowDataListView.swift
//  Assignment1
//
//  Created by Raven G on 2024-10-04.
//

import SwiftUI

struct PersonCell: View {
    var person: Entries
    @Environment(\.managedObjectContext) var context

    var body: some View {
        HStack(spacing: 15) {
            Image(person.avatar ?? "Avatar 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        
            VStack(alignment: .leading, spacing: 5) {
                Text(person.name ?? "No name given")
                    .font(.headline)
                    .bold()
                
                Text("Address: \(person.address ?? "No address given")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Email: \(person.email ?? "No email given")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Age: \(person.age)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5))
    }
}

struct ListInfoView:View {
    @Environment(\.managedObjectContext) var context
    @State private var showAlert = false
    
    @FetchRequest(
        entity: Entries.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Entries.name, ascending: true)]
    ) var people : FetchedResults<Entries>
    
    var body: some View{
        VStack(){
            ZStack{
                RoundedRectangle(cornerRadius: 40).fill(.cyan)
                    .frame(height: 200)
                    .ignoresSafeArea()
                
                Text("Players You Added")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 60)
            }

            List(people, id:\.self){ p in
                PersonCell(person: p)
                    .swipeActions(edge: .trailing){
                        Button{
                            print("Delete")
                            context.delete(p)
                            try? context.save()
                            showAlert = true
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }.tint(.red)
                    }
            }.listStyle(PlainListStyle())
                .padding(.bottom, 50)
                .alert(isPresented: $showAlert) {
                      Alert(
                          title: Text("Deleted"),
                          message: Text("Player deleted."),
                          dismissButton: .default(Text("OK"))
                      )
                  }
            Spacer()

        }
        
   
    }
}

#Preview {
    ListInfoView()
}
