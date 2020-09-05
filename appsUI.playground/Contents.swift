import SwiftUI
import PlaygroundSupport

struct ImageOverlay: View {
    var body: some View {
        ZStack {
            Text("Credit: Ricardo Gomez Angel")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}


struct ContentView: View {
    var body: some View {
        NavigationView{
            List(0..<15){_ in
                ZStack{
                    Image(uiImage: #imageLiteral(resourceName: "bg-default.png"))
                }.frame(minWidth: 0, idealWidth: 150, maxWidth: .infinity, minHeight: 0, idealHeight:100, maxHeight: .infinity, alignment: .center)
                    
                    .clipped()
                    .edgesIgnoringSafeArea(.horizontal)
                    .padding([.leading, .trailing], -16.0)
                    
            }.navigationBarTitle("Apps")
        }
    }
}


PlaygroundPage.current.setLiveView(ContentView())
