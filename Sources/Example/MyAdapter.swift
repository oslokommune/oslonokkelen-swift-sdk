import Foundation
import OslonokkelenSDK

class MyAdapter {
    let client: OslonokkelenClient
    
    init() {
        let authConfig = AuthConfig(url: URL(string: "http://localhost:4001/auth/realms/oslonokkel/protocol/openid-connect/token")!,
                                    client_id: UUID().uuidString,
                                    client_secret: "MySafeSecret")
        let config = Config(url: URL(string: "ws://0.0.0.0:4000/adapter-api/v2")!, authConfig: authConfig)
        client = OslonokkelenClient(config: config)
        client.delegate = self
    }
    
    func connect() {
        client.connect()
    }
    
    func disconnect() {
        client.disconnect()
    }
}

extension MyAdapter: OslonokkelenClientDelegate {
    func didReceive(action: Action) -> Action.Result {
        switch (action.thingId, action.id) {
        case ("FRONT-DOOR", "OPEN"):
            return .success
        case ("FRONT-DOOR", "CLOSE"):
            return .error
        default:
            return .error
        }
    }
    
    func clientDidConnect(client: OslonokkelenClient) {
        let actions = [
            Action(id: "OPEN", thingId: "FRONT-DOOR", description: "Open the door", status: .working),
            Action(id: "CLOSE", thingId: "FRONT-DOOR", description: "Close the door", status: .working)
        ]
        client.sendManifest(things: [
            Thing(id: "FRONT-DOOR",
                  description: "Front door in private house",
                  actions: actions)
            ])
        client.sendHealthCheck(actions: actions)
    }
    
    func clientDidDisconnect(client: OslonokkelenClient, error: Error?) {
        print("Adapter disconnected")
    }
}
