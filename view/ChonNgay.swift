//
//  ChonNgay.swift
//  Ledger
//
//  Created by Thong Vu on 11/2/22.
//

import SwiftUI

struct ChonNgay: View {
    //@EnvironmentObject var worker: KhachData
    @Binding var client: Khach.ThemKhach
    var body: some View {
        NavigationView {
            ScrollView {
                Section(header: Text("Let us know you name!") ){
                    VStack {
                        TextField("Your Name", text: $client.name)
                        TextField("Phone - opt", text: $client.sdt)
                        DatePicker("iPick:", selection: $client.ngay)
                            .datePickerStyle(.automatic)
                            .padding(20)
                    }.padding()
                }
                
                ChonDichVu(client: $client)
            }.navigationTitle("Get Appointment")
        }
    }
}

struct ChonNgay_Previews: PreviewProvider {
    static var previews: some View {
        ChonNgay(client: .constant(khachmau[0].mau))
            .environmentObject(KhachData())
    }
}
