import Starscream
import Foundation
import SwiftProtobuf

public struct Config {
    let url: URL
    let authConfig: AuthConfig
    
    public init(url: URL, authConfig: AuthConfig) {
        self.url = url
        self.authConfig = authConfig
    }
}

public protocol OslonokkelenClientDelegate: class {
    func didReceive(action: Action) -> Action.Result
    func clientDidConnect(client: OslonokkelenClient)
    func clientDidDisconnect(client: OslonokkelenClient, error: Error?)
}

public class OslonokkelenClient {
    let config: Config
    var socket: WebSocket?
    let authService: AuthService
    
    public weak var delegate: OslonokkelenClientDelegate?
    
    public init(config: Config) {
        self.config = config
        self.authService = AuthService(config: config.authConfig)
    }
    
    private func createSocket(with auth: Auth) {
        var request = URLRequest(url: config.url)
        request.addValue("Bearer \(auth.access_token)", forHTTPHeaderField: "Authorization")
        request.timeoutInterval = 5
        
        socket = WebSocket(request: request)
        socket?.delegate = self
    }
    
    public func connect() {
        authService.authorize { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let auth):
                self.createSocket(with: auth)
                self.socket?.connect()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func disconnect() {
        socket?.disconnect()
    }
    
    deinit {
        socket?.disconnect()
    }
}

extension OslonokkelenClient {
    public func sendManifest(things: [Thing]) {
        let thingsProto = things.map { thing -> ONThingDescription in
            let actions = thing.actions.map { action -> ONActionDescription in
                var actionProto = ONActionDescription()
                actionProto.id = action.id
                actionProto.description_p = action.description
                return actionProto
            }
            
            var thingProto = ONThingDescription()
            thingProto.id = thing.id
            thingProto.description_p = thing.description
            thingProto.actions = actions
            
            return thingProto
        }
        
        var manifest = ONManifestMessage()
        manifest.things = thingsProto
        
        var message = ONMessageFromAdapter()
        message.messageID = UUID().uuidString
        message.manifest = manifest
        
        send(message)
    }
    
    public func sendHealthCheck(actions: [Action]) {
        let actionHealths = actions.map { action -> ONActionHealthStatus in
            var actionHealth = ONActionHealthStatus()
            actionHealth.thingID = action.thingId
            actionHealth.actionID = action.id
            actionHealth.status = ONActionHealthStatus.Status(rawValue: action.status.rawValue) ?? ONActionHealthStatus.Status.unknown
            return actionHealth
        }
        
        var health = ONHealthMessage()
        health.healthStatus = actionHealths
        
        var message = ONMessageFromAdapter()
        message.messageID = UUID().uuidString
        message.healthUpdate = health
        
        send(message)
    }
    
    private func send(_ message: Message) {
        do {
            let binaryData: Data = try message.serializedData()
            socket?.write(data: binaryData)
        } catch {
            print(error)
        }
    }
}

extension OslonokkelenClient: WebSocketDelegate {
    
    public func websocketDidConnect(socket: WebSocketClient) {
        delegate?.clientDidConnect(client: self)
    }
    
    public func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        delegate?.clientDidDisconnect(client: self, error: error)
    }
    
    public func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        
    }
    
    public func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        do {
            let messageFromServer = try ONMessageFromServer(serializedData: data)
            
            guard let message = messageFromServer.message else {
                return
            }
            
            switch message {
            case .actionRequest(let action):
                guard let delegate = delegate else { return }
                
                let actionCompleted = delegate.didReceive(action: Action(id: action.actionID, thingId: action.thingID))
                
                var action = ONActionResponseMessage()
                action.result = ONActionResponseMessage.Result(rawValue: actionCompleted.rawValue) ?? .error
                var answer = ONMessageFromAdapter()
                answer.replyToMessageID = messageFromServer.messageID
                answer.messageID = UUID().uuidString
                answer.actionResponse = action
                
                send(answer)
            case .ping:
                var answer = ONMessageFromAdapter()
                answer.replyToMessageID = messageFromServer.messageID
                answer.messageID = UUID().uuidString
                answer.pong = ONPongMessage()
                
                send(answer)
            case .receipt(let receipt):
                print(receipt.message)
                break
            }
            
        } catch {
            print(error)
        }
    }
}
