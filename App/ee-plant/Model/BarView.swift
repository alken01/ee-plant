//
//  BarView.swift
//  ee-plant
//
//  Created by Alken Rrokaj on 03/05/2022.
//

import SwiftUI

struct BarView: View {
  var data: Double
  var color: Color

  var body: some View {
      VStack{
          
          if let dbl = Double(data){
              if let dbl = Int(dbl){
                  Text(String(dbl))
                      .fontWeight(.semibold)
                      .font(.system(.headline, design: .rounded))
              }
          }
          
          RoundedRectangle(cornerRadius: 10)
              .fill(color)
          }
      }
    
}
