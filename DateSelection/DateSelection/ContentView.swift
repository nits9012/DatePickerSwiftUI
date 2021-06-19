//
//  ContentView.swift
//  DateSelection
//
//  Created by Nitin Bhatt on 6/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var dateOfBirth = "MM/DD/YYYY"
    @State var date = Date()
    @State var showDatePicker = false
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Please select Date of Birth")
                    Spacer()
                    Button(action:{
                        showDatePicker = true
                    }){
                        Text(dateOfBirth)
                    }.padding(10)
                }.padding(20)
                Spacer()
                if showDatePicker{
                    DatePickerSelectionView(date: self.$date){value in
                        if value.isEmpty == false{
                            self.dateOfBirth = value
                        }
                        self.showDatePicker = false
                    }
                }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
