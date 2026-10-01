import SwiftUI

struct ContentView: View {
    @State private var hasLoaded = false
    @State private var petCount = 0
    @State private var isRevealed = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.pink.opacity(0.15), Color.purple.opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                if !isRevealed {
                    // Initial state: Just the clickable paw button
                    Button(action: {
                        hasLoaded = false // Reset so animation triggers on reveal
                        isRevealed = true
                    }) {
                        Image(systemName: "pawprint.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.pink)
                            .opacity(hasLoaded ? 1.0 : 0.0)
                            .scaleEffect(hasLoaded ? 1.0 : 0.5)
                    }
                    .buttonStyle(.plain)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.8)) {
                            hasLoaded = true
                        }
                    }
                } else {
                    // Revealed state: Full UI with animation container
                    VStack(spacing: 20) {
                        Image(systemName: "pawprint.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(.pink)
                            .opacity(hasLoaded ? 1.0 : 0.0)
                            .scaleEffect(hasLoaded ? 1.0 : 0.5)

                        Text("Daily Meow")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.primary.opacity(0.85))
                            .offset(y: hasLoaded ? 0 : -30)
                            .opacity(hasLoaded ? 1.0 : 0.0)

                        Text("Your daily reminder of happiness 🐾")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .opacity(hasLoaded ? 1.0 : 0.0)

                        Text("Pats given:\n\(petCount) 🐾")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .opacity(hasLoaded ? 1.0 : 0.0)

                        Button(action: {
                            petCount += 1
                        }) {
                            Text("Click here to pet the cat")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 24)
                                .background(.pink)
                                .cornerRadius(12)
                        }
                        .padding(.top, 10)
                        .opacity(hasLoaded ? 1.0 : 0.0)
                        .buttonStyle(.plain)
                    }
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.8)) {
                            hasLoaded = true
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}/*
 Suggested Learning Curriculum
 Module 1: Xcode & The Canvas
 What you'll learn: How Xcode works, navigating the project files, and using the live SwiftUI Preview.
 Key concepts: Understanding ContentView, basic views (Text, Image), and structure.
 Module 2: Layouts & Styling
 What you'll learn: How to arrange items on the screen.
 Key concepts: Stacks (VStack, HStack, ZStack), padding, background gradients, and custom fonts.
 Module 3: Buttons & Interactivity (@State)
 What you'll learn: Making your app respond to user taps.
 Key concepts: The Button view, state variables (@State), and updating text dynamically.
 Module 4: Bringing It All Together
 What you'll learn: Combining everything into a polished, cute finished product.
 Key concepts: Organizing your code into smaller reusable components and testing it on the iOS Simulator.
 Would you like to open Xcode right now and dive straight into Module 1?
 
 
 Module 3: Buttons & Interactivity (@State)
 Now that we have elements animating onto the screen, let's make the app actually reactive to user input.
 In SwiftUI, when you want a variable to change and automatically update what's displayed on the screen, you use an @State variable. We already used it for loading, but now we'll use it to track user taps.
 Step 1: Add a Counter State
 We'll add a new state variable to count how many times the user "pets" the kitty:
 Swift
 @State private var petCount = 0
 Step 2: The Code Update
 Update your ContentView.swift to include the counter text and a Button:
 Swift
 import SwiftUI

 struct ContentView: View {
     @State private var hasLoaded = false
     @State private var petCount = 0 // Tracks how many times the button is tapped

     var body: some View {
         ZStack {
             LinearGradient(
                 colors: [Color.pink.opacity(0.15), Color.purple.opacity(0.1)],
                 startPoint: .topLeading,
                 endPoint: .bottomTrailing
             )
             .ignoresSafeArea()

             VStack(spacing: 20) {
                 Image(systemName: "pawprint.fill")
                     .font(.system(size: 50))
                     .foregroundStyle(.pink)
                     .opacity(hasLoaded ? 1.0 : 0.0)
                     .scaleEffect(hasLoaded ? 1.0 : 0.5)

                 Text("Daily Meow")
                     .font(.system(size: 32, weight: .bold, design: .rounded))
                     .foregroundColor(.primary.opacity(0.85))
                     .offset(y: hasLoaded ? 0 : -30)
                     .opacity(hasLoaded ? 1.0 : 0.0)

                 // Dynamic text showing the counter
                 Text("Pats given: \(petCount) 🐾")
                     .font(.subheadline)
                     .foregroundColor(.secondary)
                     .opacity(hasLoaded ? 1.0 : 0.0)

                 // Interactive Button
                 Button(action: {
                     // What happens when you tap the button:
                     petCount += 1
                 }) {
                     Text("Pet the Kitty")
                         .font(.headline)
                         .foregroundColor(.white)
                         .padding(.horizontal, 24)
                         .padding(.vertical, 12)
                         .background(Color.pink)
                         .cornerRadius(12)
                 }
                 .padding(.top, 10)
                 .opacity(hasLoaded ? 1.0 : 0.0)
             }
             .padding()
         }
         .onAppear {
             withAnimation(.easeOut(duration: 0.8)) {
                 hasLoaded = true
             }
         }
     }
 }

 #Preview {
     ContentView()
 }
 What's New Here?
 String Interpolation (\(petCount)): This is how you inject variable values straight into a string of text. As petCount goes up, the screen updates automatically.
 Button(action: { ... }): A built-in SwiftUI component. The action block contains the code that runs when tapped (petCount += 1). The trailing block defines what the button looks like (pink background, white text, rounded corners).
 Quick Checkpoint 🐾
 Try tapping the "Pet the Kitty" button in your live Xcode preview. Does the counter go up?
 Let me know when you've tested it, and we can wrap up with Module 4: Putting it together & running on a simulator, or add any tweaks you want!
 */
// (1st October 2026)
/*
 Change: Did an exercise to create an additional view which leads to the main view of the application when the user clicks on the paw
 */
