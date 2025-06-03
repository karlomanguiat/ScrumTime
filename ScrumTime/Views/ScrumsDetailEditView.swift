//
//  ScrumsDetailEditView.swift
//  ScrumTime
//
//  Created by Glenn Karlo Manguiat on 6/3/25.
//

import SwiftUI

struct ScrumsDetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    @State private var attendeeName: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting details")) {
                TextField("Title", text:$scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) min")
                        .accessibilityHidden(true)
                }
            }
            Section(header: Text("Members")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: attendeeName)
                            scrum.attendees.append(attendee)
                            attendeeName = ""
                        }
                    } ) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    ScrumsDetailEditView()
}
