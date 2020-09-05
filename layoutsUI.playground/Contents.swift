import SwiftUI
import PlaygroundSupport

struct ContentView: View {
var body: some View {
    NavigationView{
        List(0..<100){b in
            if(b == 3){
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0...100, id: \.self) { index in
                                        VStack{
                                Text("Hello, playground")
                                Text("Hello, playground")
                            }
                        }
                    }
                }
            }else{
                    VStack{
                        Text("Hello, playground")
                        Text("Hello, playground")
                    }
                }
            }.navigationBarTitle("Cards Layout")
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
