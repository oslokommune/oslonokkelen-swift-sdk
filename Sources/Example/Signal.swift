import Foundation

class Signal {
    static let shared = Signal()
    
    let sigintHandler = DispatchSource.makeSignalSource(signal: SIGINT, queue: .main)
    
    func handleExit(handler: @escaping () -> ()) {
        signal(SIGINT, SIG_IGN)
        sigintHandler.setEventHandler {
            handler()
            exit(0)
        }
        sigintHandler.resume()
    }
}
