//
//  Data.swift
//  EE5
//
//  Created by Alken Rrokaj on 20/04/2022.
//

import SwiftUI

struct Plant: Codable, Hashable{
    let id: String
    var plantName: String
    var plantType: String
}

struct DataValues: Codable, Hashable{
    let sensorValue: String
}

struct Profile {
    var username: String
    var name: String
    var prefersNotifications = true

    static let `default` = Profile(username: "username", name: "Name")
}

struct Sensor: Codable, Hashable{
    let id: String
    var sensorName: String
    var sensorImage: String
    var sensorColor: String
    var favorite: String
    var sensorValue: String
    var dataType: String
    var time: String
}

struct Actuator: Codable, Hashable{
    let id: String
    var actuatorName: String
    var actuatorImage: String
    var actuatorColor: String
    var actuatorValue: String
    var time: String
}


struct Time: Codable, Hashable{
    var time: String
}

class Api{

    func toDoubleArrary(dataValues: [DataValues]) -> [Double]{
        var doubles: [Double] = []
        
        for data in dataValues {
            if let dbl = Double(data.sensorValue){
                doubles.append(dbl)
            }
            else{}
            
        }
        return doubles
    }
    
    func getPlants(completion: @escaping ([Plant]) -> ()){ //return values for this func
        guard let url = URL(string: "https://a21iot02.studev.groept.be/database/getPlants.php") else { return }
        @State var plantDef: [Plant] = []

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let plants = try? JSONDecoder().decode([Plant].self, from: data!)
            DispatchQueue.main.async {
                completion(plants ?? plantDef)
            }
        }
        .resume()
    }
    

    
        
    func getSensors(completion: @escaping ([Sensor]) -> ()){ //return values for this func
        guard let url = URL(string: "https://a21iot02.studev.groept.be/database/getSensor.php") else { return }
        @State var sensorDef: [Sensor] = []

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let sensors = try! JSONDecoder().decode([Sensor].self, from: data!)
            DispatchQueue.main.async {
                completion(sensors)
            }
        }
        .resume()
    }
    
    func getActuators(completion: @escaping ([Actuator]) -> ()){ //return values for this func
        guard let url = URL(string: "https://a21iot02.studev.groept.be/database/getActuators.php") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let actuator = try! JSONDecoder().decode([Actuator].self, from: data!)
            DispatchQueue.main.async {
                completion(actuator)
            }
        }
        .resume()
    }
    
    func getTime(completion: @escaping ([Time]) -> ()){ //return values for this func
        guard let url = URL(string: "https://a21iot02.studev.groept.be/database/getLastUpdateTime.php") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let time = try! JSONDecoder().decode([Time].self, from: data!)
            DispatchQueue.main.async {
                completion(time)
            }
        }
        .resume()
    }
    
    func getData(urlData: String, completion: @escaping ([DataValues]) -> ()){ //return values for this func
        guard let url = URL(string: urlData) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let dataValues = try! JSONDecoder().decode([DataValues].self, from: data!)
            DispatchQueue.main.async {
                completion(dataValues)
            }
        }
        .resume()
    }
    
    func send(urlData: String) -> (){ //return values for this func
        guard let url = URL(string: urlData) else { return }
        URLSession.shared.dataTask(with: url)
        .resume()
    }
    
    func getRelativeTime(time: String) -> String{
        let date = Date(timeIntervalSince1970: Double(time) ?? 0.0)
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        let relativeDate = formatter.localizedString(for: date as Date, relativeTo: Date.now)
        return relativeDate
    }
  
    
    func getStatusColor(_ status: String) -> Color {
        switch status {
         case "red":    return Color.red
         case "blue":   return Color.blue
         case "yellow": return Color.yellow
         case "cyan":   return Color.cyan
         case "green":  return Color.green
         case "brown":  return Color.brown
         case "pink":   return Color.pink
         case "teal":   return Color.teal
         case "dark":   return .dark

         default: return Color.black
        }
    }
    
    
}
