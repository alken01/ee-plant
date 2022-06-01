//
//  SystemView.swift
//  EE5
//
//  Created by Alken Rrokaj on 21/04/2022.
//

import SwiftUI

struct SystemView: View {

    @State var sensors: [Sensor] = []
    
    init() {
        UITableView.appearance().sectionHeaderHeight = .zero
    }
    
    var body: some View {
        
        Form {

                ForEach(sensors, id: \.self) { sensor in
                    Section() {
                    NavigationLink(destination: ActivityView(sensorData: sensor)) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: sensor.sensorImage)
                                    .foregroundColor(Api().getStatusColor(sensor.sensorColor))
                                Text(sensor.sensorName).bold()
                                    .foregroundColor(Api().getStatusColor(sensor.sensorColor))

                                Spacer()
                                Text(Api().getRelativeTime(time: sensor.time))                                
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.gray)
                                    .font(.caption)
                            }
                            Spacer()
                            HStack(alignment: .lastTextBaseline) {
                                if let dbl = Double(sensor.sensorValue){
                                    if let dbl = Int(dbl){
                                        Text(String(dbl))
                                            .fontWeight(.semibold)
                                            .font(.system(.title, design: .rounded))
                                    }
                                }
                                Text(sensor.dataType)
                                    .font(.headline)
                                    .fontWeight(.semibold).foregroundColor(
                                        Color.gray
                                    )
                                    .padding(.leading, -5.0)
                            }
                        }
                    }
                    .padding()
                }
            
            }
            
        }
        .refreshable{
            Api().getSensors { sensors in self.sensors = sensors }

        }
        .task {
            Api().getSensors { sensors in self.sensors = sensors }
        }
        
//        
//        .navigationBarItems(trailing: Button(action: {
//            self.isEditing.toggle()}, label: { Image( systemName: "star" )}))
//    
        
        .navigationBarTitle("Sensors")
    }
}
