import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var steamUser = ""
    @State private var steamPass = ""
    
    var body: some View {
        VStack {
            if !isLoggedIn {
                // LOGIN SCREEN
                Text("Steam Login").font(.title).bold()
                TextField("Username", text: $steamUser).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                SecureField("Password", text: $steamPass).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                Button("Login to Steam") {
                    isLoggedIn = true // This triggers the backend sync
                }.padding().background(Color.blue).foregroundColor(.white).cornerRadius(10)
            } else {
                // LIBRARY LIST (Choose before entering container)
                Text("Your Steam Library").font(.headline)
                List {
                    GameRow(name: "Terraria", id: "105600")
                    GameRow(name: "Among Us", id: "945360")
                }
            }
        }.padding()
    }
}

struct GameRow: View {
    var name: String
    var id: String
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Button("Download") {
                // SCRIPT: steamcmd.sh +login user pass +app_update \(id)
                print("Downloading \(name) in background...")
            }.foregroundColor(.blue)
            Button("Play") {
                // This is where it finally opens the container
                print("Opening Container for \(name)...")
            }.padding(5).background(Color.green).foregroundColor(.white).cornerRadius(5)
        }
    }
}
