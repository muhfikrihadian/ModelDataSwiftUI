//
//  ContentView.swift
//  ModelDataSwiftUI
//
//  Created by Ipung Dev Center on 23/06/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    //data baru
    
    let data : [DataModel] = [
        DataModel(id: 1, namaproduk: "MacBook Pro M1 512 GB", fotoproduk: "ic_macbook", hargaproduk: 22499000, lokasi: "Jakarta Selatan", ratingcount: 5, jumlahrating: 56),
        DataModel(id: 2, namaproduk: "iPad Pro Gen-5 256 GB", fotoproduk: "ic_ipad", hargaproduk: 18199000, lokasi: "Jakarta Barat", ratingcount: 5, jumlahrating: 50),
        DataModel(id: 3, namaproduk: "iPhone 13 Pro Max 256 GB", fotoproduk: "ic_iphone", hargaproduk: 21999000, lokasi: "Jakarta Utara", ratingcount: 4, jumlahrating: 56),
        DataModel(id: 4, namaproduk: "AirPods Pro", fotoproduk: "ic_airpods", hargaproduk: 3499000, lokasi: "Jakarta Pusat", ratingcount: 4, jumlahrating: 56),
        DataModel(id: 5, namaproduk: "Apple Watch SE", fotoproduk: "ic_apple_watch", hargaproduk: 5499000, lokasi: "Jakarta Timur", ratingcount: 3, jumlahrating: 56)
    ]
    
//    @State var jumlahkeranjang: Int = 0
    @ObservedObject var globalData = GlobalObject()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(data) { row in
                    VStack(spacing:10) {
                        //baca data binding dari Produk komponent
                        Product(data: row, jumlahKeranjang: self.globalData)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("AppleArea")
            .navigationBarItems(
                trailing:
                HStack(spacing: 20){
                    Button(action: {print()}){
                        Image(systemName: "person.fill")
                    }
                    NavigationLink(destination: DetailView(globalData: self.globalData)){
                        keranjangView(jumlahKeranjang: self.globalData)
                    }
                    
                }
            )
        }
        .accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DetailView : View{
    @ObservedObject var globalData : GlobalObject
    var body: some View{
        NavigationView{
            Text("Detail")
                .navigationBarTitle("Detail")
                .navigationBarItems(
                    trailing:
                    HStack(spacing: 20){
                        Button(action: {print()}){
                            Image(systemName: "person.fill")
                        }
                        keranjangView(jumlahKeranjang: self.globalData)
                        
                    }
                )
        }
    }
}

struct keranjangView : View {
    
    @ObservedObject var jumlahKeranjang : GlobalObject
    var body : some View {
        ZStack{
            Image(systemName: "cart.fill")
                .resizable()
                .frame(width:20, height:20)
            
            Text("\(self.jumlahKeranjang.jumlah)")
                .foregroundColor(Color.white)
                .frame(width:10, height:10)
                .font(.body)
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
                .offset(x:10,y:-10)
        }
    }
}

struct Product : View {
    
    let data: DataModel
    @ObservedObject var jumlahKeranjang : GlobalObject
    var body : some View {
        VStack(alignment:.leading){
            ZStack(alignment:.topTrailing){
                Image(self.data.fotoProduk)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height:200)
                    .clipped()
                    .padding()
                
                Button(action: {print("OK")}){
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(Color.red)
                }
            }
            
            Text(self.data.namaProduk)
                .font(.system(size: 25))
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            Text("Rp.\(self.data.hargaProduk)")
                .font(.system(size: 20))
                .foregroundColor(Color.green)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasi)
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top, 1)
            
            
            HStack{
                HStack{
                    ForEach(0..<self.data.ratingCount){
                        items in
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    }
                    
                }
            }
            .padding(.leading)
            .padding(.trailing)
            tambahKeranjang(jumlahKeranjang: jumlahKeranjang)
        }
        .cornerRadius(15)
    }
}

struct tambahKeranjang : View {
    
    @ObservedObject var jumlahKeranjang : GlobalObject
    var body : some View {
        Button(action: {self.jumlahKeranjang.jumlah += 1}){
            HStack {
                Spacer()
                HStack{
                    Image(systemName: "cart")
                    Text("Tambah ke Keranjang")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.green)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .padding()
    }
}


