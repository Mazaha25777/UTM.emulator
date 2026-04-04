import SwiftUI

@main
struct UTMApp: App {
    @StateObject var data = UTMData()
    
    var body: some Scene {
        WindowGroup {
            // This forces the app to open your Steam list first
            SteamLibraryView()
                .environmentObject(data)
        }
    }
}
