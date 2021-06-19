//
//  DatePickerSelectionView.swift
//  DateSelection
//
//  Created by Nitin Bhatt on 6/19/21.
//

import SwiftUI
import UIKit

struct DatePickerSelectionView: View {
    
    @Binding var date: Date
    var selectedDate: Binding<Date> {
      Binding<Date>(get: { self.date}, set : {
          self.date = $0
          self.setDateString()
      })
    }
    
    @State private var selectedDateText: String = ""
    var action: (_ params:String) -> Void = {_ in }
    
    private func setDateString() {
      let formatter = DateFormatter()
      formatter.dateFormat = "MM/dd/yyyy"
      self.selectedDateText = formatter.string(from: self.date)
    }
    
    var body: some View {
        VStack(spacing: 0){
          HStack{
              Button(action: {
                  endEditing()
                  action("")
              }){
                  Text("Cancel").foregroundColor(Color("DarkGray")).frame(width: 80, height: 30, alignment: .center)
              }.frame(width: 80, height: 40, alignment: .center).background(Color(UIColor.systemBackground))
              Spacer()
              Button(action: {
                  endEditing()
                  action(selectedDateText)
              }){
                  Text("Done").foregroundColor(Color("DarkGray")).frame(width: 80, height: 30, alignment: .center)
              }.frame(width: 80, height: 40, alignment: .center).background(Color(UIColor.systemBackground))
          }.frame(height: 40).border(Color("DarkGray"), width: 1).padding(.bottom,0).background(Color(UIColor.systemBackground))
         
          HStack(spacing: 0){
              DatePicker("", selection: selectedDate,
                         in: ...Date(), displayedComponents: .date)
              .datePickerStyle(WheelDatePickerStyle())
              .labelsHidden()
          }.background(Color(UIColor.systemBackground))
        }.frame(height: 100).background(Color(UIColor.systemBackground)).padding(.bottom, 20)
    }
}

private func endEditing(){
    UIApplication.shared.windows.first{$0.isKeyWindow}?.endEditing(true)
}
