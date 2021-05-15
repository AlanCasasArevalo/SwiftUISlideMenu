import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let text: String
    let imageName: String
    let handler: () -> Void = {
        print("Tapped item")
    }
}

struct MenuContent: View {
    
    let width: CGFloat
    
    let items: [MenuItem] = [
        MenuItem(text: "Home", imageName: "house"),
        MenuItem(text: "Profile", imageName: "person.circle"),
        MenuItem(text: "Settings", imageName: "gear"),
        MenuItem(text: "Activity", imageName: "bell"),
        MenuItem(text: "Flights", imageName: "airplane"),
        MenuItem(text: "Share", imageName: "square.and.arrow.up")
    ]
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 35/255, green: 33/255, blue: 33/255, alpha: 1))
            VStack (alignment: .leading, spacing: 0) {
                ForEach(items) { item in
                    HStack {
                        Image(systemName: item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32, alignment: .center)
                        
                        Text(item.text)
                            .font(.system(size: 22))
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    .onTapGesture {
                        item.handler()
                    }
                    .padding()
                    Divider()
                }
                
                Spacer()
            }
            .padding(.top, 25)
                
        }
    }
}

struct MenuContent_Previews: PreviewProvider {
    static var previews: some View {
        MenuContent(width: 300)
    }
}

