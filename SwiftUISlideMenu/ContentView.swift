//
//  ContentView.swift
//  SwiftUISlideMenu
//
//  Created by Tecdata Engineering on 10/5/21.
//

import SwiftUI

struct ContentView: View {

    @State var menuOpened = false
    
    var body: some View {
        ZStack {
            if !menuOpened {
                Button(action: {
                    //Open menu
                    self.menuOpened.toggle()
                }, label: {
                    Text("Open Menu")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color(.systemBlue))
                })
            } else {
                SideMenu(width: UIScreen.main.bounds.width/1.2, menuOpened: menuOpened, toggleMenu: toggleMenu)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func toggleMenu () {
        menuOpened.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
