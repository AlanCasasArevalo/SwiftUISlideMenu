//
//  SideMenu.swift
//  SwiftUISlideMenu
//
//  Created by Tecdata Engineering on 10/5/21.
//

import SwiftUI

struct SideMenu: View {
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.15))
            .opacity(self.menuOpened ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.toggleMenu()
            }
            
            //Menu Content
            HStack {
                // If you want the menu on opposite side just change Spacer() after MenuContent
                Spacer()
                MenuContent(width: UIScreen.main.bounds.width/1.6)
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
            }
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(width: UIScreen.main.bounds.width/1.6,menuOpened: true, toggleMenu: {
        })
    }
}
