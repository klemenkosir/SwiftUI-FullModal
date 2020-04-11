# Present ViewModifier - SwiftUI
My try at the full screen modal presentation in SwiftUI packed in a convenient ViewModifier

## How to use
Just drag and drop the `PresentModifier.swift` file and you are ready to go by writing 

`present($isPresented, view: YourView())` 

## Example

```
struct ContentView: View {
	
	@State var isPresented: Bool = false
	
	var body: some View {
		NavigationView {
			Button(action: {
				self.isPresented.toggle()
			}) {
				Text("Present")
			}
			.navigationBarTitle("Some title")
		}
		.present($isPresented, view: ModalView(isPresented: $isPresented))
	}
}

struct ModalView: View {
	
	@Binding var isPresented: Bool
	
	var body: some View {
		Button(action: {
			self.isPresented.toggle()
		}) {
			Text("Dismiss")
		}
	}
}
```
