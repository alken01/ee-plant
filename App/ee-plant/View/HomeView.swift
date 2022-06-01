import SwiftUI

struct HomeView: View {
    @State private var showingProfile = false
    @State private var draftProfile = Profile.default
    @State var time: [Time] = []
    @State var sensors: [Sensor] = []
    @State var actuators: [Actuator] = []
    private let refreshControl = UIRefreshControl()
    
    @State private var ledBool:Bool = false
    @State private var waterBool:Bool = false
    @State private var fanBool:Bool = false
    @State private var heaterBool:Bool = false


    var body: some View {
        Form {
            Section {
                //System Name
                HStack {
                    Text("ee-plant").font(.title).fontWeight(.bold)
                    Image("icon")
                }
                .padding(.all, 10.0)

                //System Image
                Image("MockV1")
                    .resizable().scaledToFit().padding()
                
                HStack(alignment: .bottom, spacing: 25){
                    ForEach(sensors, id: \.self) { sensor in
                        if sensor.favorite == "1" {
                            HStack {
                                Image(systemName: sensor.sensorImage)
                                    .foregroundColor(Api().getStatusColor(sensor.sensorColor))
                             
                                if let dbl = Double(sensor.sensorValue){
                                    if let dbl = Int(dbl){
                                        Text(String(dbl))
                                            .fontWeight(.semibold)
                                            .font(.system(.title, design: .rounded))
                                    }
                                }
                                
                                Text(sensor.dataType)
                                    .font(.headline)
                                    .fontWeight(.semibold).foregroundColor(Color.gray)
                                    }
                                }
                            }
                }
                .padding()
                
                
            }
            
            Section(
                header: Text("Controls")
                    .fontWeight(.bold)
                    .foregroundColor(Color.dark)
                    .textCase(nil)
                    .font(.title2)
            ) {
                HStack(spacing: 25){
                    ForEach(actuators, id: \.self) { actuator in

                        Button(action: {
                            
                            if actuator.actuatorValue=="0"  {
                                let url = "https://a21iot02.studev.groept.be/database/setActuatorOne.php?id=" + actuator.id
                                Api().send(urlData: url)
                                Api().getActuators{ actuators in self.actuators = actuators }
                            } else if actuator.actuatorValue=="1" {
                                let url = "https://a21iot02.studev.groept.be/database/setActuatorZero.php?id=" + actuator.id
                                Api().send(urlData: url)
                                Api().getActuators{ actuators in self.actuators = actuators }
                            }

                        }) {
                            Image(systemName: actuator.actuatorImage )
                                .font(.largeTitle)
                                .foregroundColor(actuator.actuatorValue=="1" ? Api().getStatusColor(actuator.actuatorColor) : .gray)
                        }
                        
                        .padding().buttonStyle(BorderlessButtonStyle())
                
                    }
                }
                
            }
                
        }
        .refreshable{
            Api().getSensors { sensors in self.sensors = sensors }
            Api().getActuators{ actuators in self.actuators = actuators }

        }
            
        .task {
            Api().getActuators{ actuators in self.actuators = actuators }
            Api().getSensors { sensors in self.sensors = sensors }
        }
    
        
        .navigationTitle("Home")
    }
}

//Code for colors
extension Color {
    static let dark = Color("Dark")
    static let iconColor = Color("iconColor")
}
