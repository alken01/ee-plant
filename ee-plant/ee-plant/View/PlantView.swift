import SwiftUI

struct PlantView: View {
    @State var plants: [Plant] = []
    @State var isAdding = true
    @State var name = ""
    @State var type = ""
    @State var sensors: [Sensor] = []

    init() {
        UITableView.appearance().sectionHeaderHeight = .zero
    }
    
    var body: some View {
        
        Form{
            ForEach(plants, id: \.self) { plant in    
                Section{
                    HStack {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.green)
                            .font(.title)
                            .padding(.trailing, 10.0)
                        
                        VStack(alignment: .leading) {
                            Text(plant.plantName).fontWeight(.bold)
                            Text(plant.plantType)
                        }
                    }
                }
            }
            .onDelete(perform: delete)
            .padding()
            .padding(.leading, -10.0)

        }
//        .refreshable{ Api().getPlants { plants in self.plants = plants } }
        .task{ Api().getPlants { plants in self.plants = plants } }
        
        .navigationBarItems(
            leading: Button(
                action: { isAdding.toggle() },
                label:  { Image(systemName: "plus") }
            ),
            trailing: EditButton()
        )
        .navigationBarTitle("Plants")
            
    }

    
    func delete(at offsets:  IndexSet)
    {
        let idsToDelete = offsets.map { self.plants[$0].id }
        plants.remove(atOffsets: offsets)
        let url = "https://a21iot02.studev.groept.be/database/removePlant.php?id=" + idsToDelete.first!
        Api().send(urlData: url)
    }
    
    func add()
    {
    }
}
