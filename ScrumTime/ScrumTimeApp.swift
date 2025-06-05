//
//  ScrumTimeApp.swift
//  ScrumTime
//
//  Created by Glenn Karlo Manguiat on 6/3/25.
//

import SwiftUI

@main
struct ScrumTimeApp: App {
    
    @State private var scrums = DailyScrum.sampleData

    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
