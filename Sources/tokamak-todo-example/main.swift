import TokamakDOM

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

  func addNewItem() {
    items.append(Item(text: newItem))
    newItem = ""
  }

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Button("+", action: addNewItem)
        TextField("New todo item", text: $newItem, onCommit: addNewItem)
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
    .padding(.top, 70)
    .padding(.horizontal, 40)
  }
}

// @main attribute is not supported in SwiftPM apps.
// See https://bugs.swift.org/browse/SR-12683 for more details.
TokamakApp.main()
