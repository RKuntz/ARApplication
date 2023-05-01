import SwiftUI

struct StartWindow: View {
    var body: some View {
            NavigationStack{
                ZStack {
                    Image("donutbackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .padding(.leading, -60) // Move 20 points to the left

                    VStack {
                        Text("Welcome to Guru Donuts")
                            .font(.custom("Arial Rounded MT Bold", size: 40))
                                .textCase(.uppercase)
                                .foregroundColor(.white)
                                .padding(.top, 50)
                                .padding(.bottom, 30)
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                        Text("First, are you comfortable waiting in a line?")
                            .font(.system(size: 24, weight: .medium))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.pink)
                            .padding()

                        HStack{
                            NavigationLink(destination:ContentView()){
                                Text("Yes")
                                    .font(.system(size: 28, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(width: 160, height: 60)
                                    .background(Color.orange)
                                    .cornerRadius(30)
                            }
                            .padding(.trailing, 30.0)
                            NavigationLink(destination:ShowTables()){
                                Text("No")
                                    .font(.system(size: 28, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(width: 160, height: 60)
                                    .background(Color.orange)
                                    .cornerRadius(30)
                                
                            }
                            .padding(.leading, 30.0)
                            
                        }
                        .padding(.top)
                    }

                }
            }
        }
    }
    struct StartWindow_Previews: PreviewProvider {
        static var previews: some View {
            StartWindow()
        }
    }
