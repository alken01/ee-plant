//
//  BarChartView.swift
//  ee-plant
//
//  Created by Alken Rrokaj on 03/05/2022.
//

import SwiftUI

struct BarChartView: View {
    var data: [Double]
    var color: Color

    var highestData: Double {
        let max = data.max() ?? 1.0
        if max == 0 { return 1.0 }
        return max
    }

  var body: some View {
    GeometryReader { geometry in

        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .bottom, spacing: 10.0) {
                ForEach(data.indices.reversed(), id: \.self) { index in
                    let width = 50.0

                    //if data is less than 7% make it be shown as 7% in the bars
                    if(data[index]<0.07*highestData){
                        let height = geometry.size.height * 7.0 / highestData
                        BarView(data: data[index], color: color)
                        .frame(width: width, height: height, alignment: .bottom)
                    }
                    else{
                        let height = geometry.size.height * data[index] / highestData
                        BarView(data: data[index], color: color)
                        .frame(width: width, height: height, alignment: .bottom)
                    }
    
                
                }
            }
        }
    }
    }
}
