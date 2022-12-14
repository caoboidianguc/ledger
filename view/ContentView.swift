//
//  ContentView.swift
//  Ledger
//
//  Created by Thong Vu on 5/11/22.
//
import SwiftUI

struct ContentView: View {
    
    let luuThayDoi: () -> Void
    @State var newCus = Khach.ThemKhach()
    @Environment(\.scenePhase) private var scene
    @State private var manhinh: chon = .khach
    enum chon {
        case schedule
        case khach
        case dv
        case xep
    }
    
    var body: some View {
        TabView(selection: $manhinh) {
            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar.badge.clock")
                }
                .tag(chon.schedule)
            
            ClientList()
                
                .tabItem {
                    Label("Client", systemImage: "person.text.rectangle")
                }
                .tag(chon.khach)
                
            
            ServiceView()
                .tabItem {
                    Label("Services", systemImage: "list.dash")
                }
                .tag(chon.dv)
            
            XapSep()
                .tabItem{
                    Label("Earns", systemImage: "dongsign")
                }
                .tag(chon.xep)
            
        }
            .onChange(of: scene){ phase in
                if phase == .inactive {
                    luuThayDoi()
                }
            }
            
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(luuThayDoi: {})
            .environmentObject(KhachData())
    }
}
