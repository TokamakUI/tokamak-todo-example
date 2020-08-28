import TokamakShim

struct TokamakApp: App {
  var body: some Scene {
    WindowGroup("Tokamak App") {
      ContentView()
    }
  }
}

struct Item {
  var isCompleted: Bool = false
  var text: String
}

struct ContentView: View {
  @State var newItem = ""
  @State var items = [Item]()
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Button("+") {
          items.append(Item(text: newItem))
          newItem = ""
        }
        TextField("New todo item", text: $newItem)
      }
      List {
        ForEach(0..<items.count, id: \.self) { i in
          Toggle(
            items[i].text,
            isOn: Binding(get: { items[i].isCompleted }, set: { items[i].isCompleted = $0 })
          )
        }
      }
    }
  }
}

// @main attribute is not supported in SwiftPM apps.
// See https://bugs.swift.org/browse/SR-12683 for more details.
TokamakApp.main()
