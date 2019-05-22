import Foundation

public struct Action {
    public let id: String
    public let thingId: String
    public let description: String
    public let status: Status
    
    public init(id: String, thingId: String, description: String = "", status: Status = .unknown) {
        self.id = id
        self.thingId = thingId
        self.description = description
        self.status = status
    }
    
    public enum Result: Int {
        case success
        
        /// Some permanent error, retrying the action will probably not help
        case error
        
        /// Some temporary error, retrying might help.
        case hiccup
        
        /// Access denied
        case denied
    }
    
    public enum Status: Int {
        /// Everything is working fine. The backend is free to execute it
        case working
        
        /// Something is wrong.
        /// Please add an error code and map an informative error message
        /// in Oslonøkkelens admin panel.
        case broken
        
        /// The action is not supposed to be executed right now (closed).
        /// Please set the 'code' field to support mapping of user friendly messages.
        case unavailable
        
        /// We just don't know
        case unknown
    }
}

public struct Thing {
    public let id: String
    public let description: String
    public let actions: [Action]
    
    public init(id: String, description: String = "", actions: [Action]) {
        self.id = id
        self.description = description
        self.actions = actions
    }
}
