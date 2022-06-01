//
//  MainView.swift
//  ee-plant
//
//  Created by Alken Rrokaj on 05/05/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {

        TabView{
            
            NavigationView{
                HomeView()
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
            }
            
            NavigationView{
                SystemView()
                }
                .tabItem {
                    Image(systemName: "waveform")
                    Text("Sensors")
            }
            
            NavigationView{
                PlantView()
                }
                .tabItem {
                    Image(systemName: "camera.macro")
                    Text("Plants")
            }
            
            NavigationView{
                ProfileSummary(profile: Profile.default)
                }
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
            }
            
        }
    }
}
