//
//  ActivityView.swift
//  ee-plant
//
//  Created by Alken Rrokaj on 03/05/2022.
//

import SwiftUI


struct ActivityView: View {

    var sensorData: Sensor
    @State private var dataValues: [DataValues] = []
    
    var body: some View {
   
        VStack(alignment: .leading) {
            HStack(alignment: .bottom){
            
                if let dbl = Double(sensorData.sensorValue){
                    if let dbl = Int(dbl){
                        HStack{
                        Image(systemName: sensorData.sensorImage)
                            .foregroundColor(Api().getStatusColor(sensorData.sensorColor))
                        Text("Latest Value: " + String(dbl) + sensorData.dataType)
                            .font(.system(.title3, design: .rounded))
                            .bold()
                        }
                        .foregroundColor(Api().getStatusColor(sensorData.sensorColor))
                    }
                }
                Spacer()
                
                Text(Api().getRelativeTime(time: sensorData.time))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .font(.caption)
            }
            
            BarChartView(data: Api().toDoubleArrary(dataValues: dataValues), color: Api().getStatusColor(sensorData.sensorColor))
        }
        .onAppear {
            let url = "https://a21iot02.studev.groept.be/database/getSensorGraph.php?id=" + sensorData.id
            Api().getData(urlData: url, completion: { dataValues in self.dataValues = dataValues })
        }
        .navigationBarTitle(sensorData.sensorName)
        .padding()
    }
}

