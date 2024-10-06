//
//  AddInfoView.swift
//  Assignment1
//
//  Created by Raven G on 2024-09-27.
//

import Foundation
import SwiftUI

struct AddInfoView: View {
    @State private var name: String = ""
    @State private var address: String = ""
    @State private var email: String = ""
    @State private var age: Int16 = 0
    @State private var selectedAvatar: String =  "Avatar 1"
    @State private var alertMessage = ""
    @State private var showAlert = false
    private var avatars = ["Avatar 1", "Avatar 2", "Avatar 3"]
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        VStack(){
            ZStack{
                RoundedRectangle(cornerRadius: 40).fill(.cyan)
                    .frame(height: 200)
                    .ignoresSafeArea()
                
                Text("Welcome! Add some players")
                    .font(.title2)
                    .bold()
                    .padding(.top, 100)
                
            }
            .padding(.bottom)
            
            Text("Pick Your Avatar").bold()
                .padding(.bottom, 10)
            
            ScrollView(.horizontal) {
                HStack(spacing: 30) {
                    ForEach(avatars, id: \.self) { imageName in
                        Button(action: {
                            
                            selectedAvatar = imageName
                            print("\(imageName) tapped")
                        }) {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                            
                                .shadow(radius: 5)
                        }
                    }
                }
            }
            .padding(.bottom, 10)
            Text("Selected Avatar: \(selectedAvatar)")
                .bold()
                .padding(.top)
                .padding(.bottom, 10)
            TextField("", text: $name, prompt: Text("Name").foregroundColor(.gray))
                .padding()
                .frame(height: 45)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 0.3)
                ).padding(.horizontal)
                .padding(.bottom, 10)
            
            TextField("", text: $address, prompt: Text("Address").foregroundColor(.gray))
                .padding()
                .frame(height: 45)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 0.3)
                    
                ) .padding(.horizontal)
                .padding(.bottom, 10)
            
            TextField("", value: $age,format: .number, prompt: Text("Age ").foregroundColor(.gray))
                .padding()
                .frame(height: 45)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 0.3)
                    
                ) .padding(.horizontal)
                .padding(.bottom, 10)
            TextField("", text: $email, prompt: Text("Email ").foregroundColor(.gray))
                .padding()
                .frame(height: 45)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 0.3)
                    
                ) .padding(.horizontal)
                .padding(.bottom, 10)
            
            Button(action: {
                print("Add data button clicked")
                self.addNewPerson()
                alertMessage = "Thank you \(name) for your submission"
                showAlert = true
               
            }) {
                Text("Submit Information")
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 250)
                    .background(Color.cyan)
                    .cornerRadius(15)
            }
            .padding(.bottom, 80)
            .alert(isPresented: $showAlert) {
                     Alert(title: Text("Submission Successful"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                 }
            Spacer()
            
            
            
            
            
        }
    }
    func addNewPerson(){
        
        let pers = PersistenceController.shared
        pers.saveEntry(name: name, email: email, address: address, age: Int16(age), avatar: selectedAvatar)
        //rememberEnteredData()
    }
    
    
    
    
    
}

#Preview {
    
    AddInfoView()
}
