import Foundation

let adapter = MyAdapter()
adapter.connect()

Signal.shared.handleExit {
    print("\nCleanup connection before exit")
    adapter.disconnect()
}

while(true) {
    RunLoop.current.run(until: Date())
    usleep(10)
}
