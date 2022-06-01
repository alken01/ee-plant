import SwiftUI

struct BarContent: View {
    var body: some View {
        Button {
            print("Profile tapped")
        } label: {
            ProfileSummary(profile: Profile.default)
        }
    }
}

struct ProfileSummary: View {
    var profile: Profile
    @State var notificationsOn = false
    
    var body: some View {
        
        List {
            
            HStack {
                Image(systemName: "person.circle")
                Text(profile.username)
            }
            
            HStack {
                Text("Name").bold()
                Text(profile.name)

            }
            
            Toggle(isOn: $notificationsOn) {
                Text("Enable Notifications").bold()
            }

        }
        .navigationBarTitle("Profile")

    }
}
