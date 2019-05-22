// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: data.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Data types used in messages

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Profile information the adapter can request.
/// Remember that in a GDPR world you need to justify this each and every one of these.. 
enum ONActorProfileParameter: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case nationalIDNumber // = 0
  case phoneNumber // = 1
  case emailAddress // = 2
  case fullName // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .nationalIDNumber
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .nationalIDNumber
    case 1: self = .phoneNumber
    case 2: self = .emailAddress
    case 3: self = .fullName
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .nationalIDNumber: return 0
    case .phoneNumber: return 1
    case .emailAddress: return 2
    case .fullName: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension ONActorProfileParameter: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [ONActorProfileParameter] = [
    .nationalIDNumber,
    .phoneNumber,
    .emailAddress,
    .fullName,
  ]
}

#endif  // swift(>=4.2)

/// Boolean on steroids that also
/// communicates the "don't know" case 
enum ONState: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case yes // = 0
  case no // = 1
  case unknown // = 2
  case UNRECOGNIZED(Int)

  init() {
    self = .yes
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .yes
    case 1: self = .no
    case 2: self = .unknown
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .yes: return 0
    case .no: return 1
    case .unknown: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension ONState: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [ONState] = [
    .yes,
    .no,
    .unknown,
  ]
}

#endif  // swift(>=4.2)

/// Describes the health status of an action 
struct ONActionHealthStatus {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Identifies the thing. 
  var thingID: String = String()

  /// Identifies the action within the thing. 
  var actionID: String = String()

  /// Is it healthy or not?
  /// The backend will not execute actions reported broken 
  var status: ONActionHealthStatus.Status = .working

  /// Oslonøkkelen won't invoke actions reported broken. By providing an
  /// error code together with a message flagging an action as broken you
  /// enable the backend to generate nice and localized error messages 
  var code: String = String()

  /// Optional technical message intended to debugging.
  /// This message will never be sent to the end user of the app. 
  var message: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Current status 
  enum Status: SwiftProtobuf.Enum {
    typealias RawValue = Int

    /// Everything is working fine. The backend is free to execute it 
    case working // = 0

    /// Something is wrong.
    /// Please add an error code and map an informative error message
    /// in Oslonøkkelens admin panel. 
    case broken // = 1

    /// The action is not supposed to be executed right now (closed).
    /// Please set the 'code' field to support mapping of user friendly messages. 
    case unavailable // = 2

    /// We just don't know 
    case unknown // = 3
    case UNRECOGNIZED(Int)

    init() {
      self = .working
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .working
      case 1: self = .broken
      case 2: self = .unavailable
      case 3: self = .unknown
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .working: return 0
      case .broken: return 1
      case .unavailable: return 2
      case .unknown: return 3
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension ONActionHealthStatus.Status: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [ONActionHealthStatus.Status] = [
    .working,
    .broken,
    .unavailable,
    .unknown,
  ]
}

#endif  // swift(>=4.2)

/// Contains the latest value for a property. 
struct ONPropertyUpdate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Identifies the thing. 
  var thingID: String {
    get {return _storage._thingID}
    set {_uniqueStorage()._thingID = newValue}
  }

  /// Identifies the property within the thing 
  var propertyID: String {
    get {return _storage._propertyID}
    set {_uniqueStorage()._propertyID = newValue}
  }

  var update: OneOf_Update? {
    get {return _storage._update}
    set {_uniqueStorage()._update = newValue}
  }

  /// Battery level
  var batteryLevel: ONPropertyUpdate.BatteryLevel {
    get {
      if case .batteryLevel(let v)? = _storage._update {return v}
      return ONPropertyUpdate.BatteryLevel()
    }
    set {_uniqueStorage()._update = .batteryLevel(newValue)}
  }

  /// Locked (door closed and bolt engaged)
  var locked: ONPropertyUpdate.Locked {
    get {
      if case .locked(let v)? = _storage._update {return v}
      return ONPropertyUpdate.Locked()
    }
    set {_uniqueStorage()._update = .locked(newValue)}
  }

  /// Door in open position
  var `open`: ONPropertyUpdate.Open {
    get {
      if case .open(let v)? = _storage._update {return v}
      return ONPropertyUpdate.Open()
    }
    set {_uniqueStorage()._update = .open(newValue)}
  }

  /// Text message
  var statusMessage: ONPropertyUpdate.StatusMessage {
    get {
      if case .statusMessage(let v)? = _storage._update {return v}
      return ONPropertyUpdate.StatusMessage()
    }
    set {_uniqueStorage()._update = .statusMessage(newValue)}
  }

  /// Signal strength
  var signalStrength: ONPropertyUpdate.Signal {
    get {
      if case .signalStrength(let v)? = _storage._update {return v}
      return ONPropertyUpdate.Signal()
    }
    set {_uniqueStorage()._update = .signalStrength(newValue)}
  }

  /// Key / value
  var other: ONPropertyUpdate.Other {
    get {
      if case .other(let v)? = _storage._update {return v}
      return ONPropertyUpdate.Other()
    }
    set {_uniqueStorage()._update = .other(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_Update: Equatable {
    /// Battery level
    case batteryLevel(ONPropertyUpdate.BatteryLevel)
    /// Locked (door closed and bolt engaged)
    case locked(ONPropertyUpdate.Locked)
    /// Door in open position
    case `open`(ONPropertyUpdate.Open)
    /// Text message
    case statusMessage(ONPropertyUpdate.StatusMessage)
    /// Signal strength
    case signalStrength(ONPropertyUpdate.Signal)
    /// Key / value
    case other(ONPropertyUpdate.Other)

  #if !swift(>=4.1)
    static func ==(lhs: ONPropertyUpdate.OneOf_Update, rhs: ONPropertyUpdate.OneOf_Update) -> Bool {
      switch (lhs, rhs) {
      case (.batteryLevel(let l), .batteryLevel(let r)): return l == r
      case (.locked(let l), .locked(let r)): return l == r
      case (.open(let l), .open(let r)): return l == r
      case (.statusMessage(let l), .statusMessage(let r)): return l == r
      case (.signalStrength(let l), .signalStrength(let r)): return l == r
      case (.other(let l), .other(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  /// Report battery level in percent 0-100% 
  struct BatteryLevel {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// 0-100%
    var percent: UInt32 = 0

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  /// Report that the thing is locked and cannot be opened without the "key" 
  struct Locked {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Locked
    var state: ONState = .yes

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  /// Report that the thing is in an open position 
  struct Open {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Physically in open position
    var state: ONState = .yes

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  /// Report a generic status message intended for debugging. 
  struct StatusMessage {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Status message
    var message: String = String()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  /// Signal strength 
  struct Signal {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Wifi, bluetooth...
    var type: ONPropertyUpdate.Signal.Radio = .wifi

    /// Signal strength in percent
    var percent: UInt32 = 0

    /// Signal strength in dDm
    var dBm: Int32 = 0

    var unknownFields = SwiftProtobuf.UnknownStorage()

    enum Radio: SwiftProtobuf.Enum {
      typealias RawValue = Int
      case wifi // = 0
      case bluetooth // = 1
      case gsm // = 2
      case zigbee // = 3
      case zwave // = 4
      case lora // = 5
      case UNRECOGNIZED(Int)

      init() {
        self = .wifi
      }

      init?(rawValue: Int) {
        switch rawValue {
        case 0: self = .wifi
        case 1: self = .bluetooth
        case 2: self = .gsm
        case 3: self = .zigbee
        case 4: self = .zwave
        case 5: self = .lora
        default: self = .UNRECOGNIZED(rawValue)
        }
      }

      var rawValue: Int {
        switch self {
        case .wifi: return 0
        case .bluetooth: return 1
        case .gsm: return 2
        case .zigbee: return 3
        case .zwave: return 4
        case .lora: return 5
        case .UNRECOGNIZED(let i): return i
        }
      }

    }

    init() {}
  }

  /// Report some other data not explicitly supported / defined. 
  struct Other {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Key
    var id: String = String()

    /// Value
    var value: String = String()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Describes a thing attached to the adapter.
/// This can be doors, z-wave controllers, light bulbs.. 
struct ONThingDescription {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Something that identifies the thing within the adapter 
  var id: String = String()

  /// A human readable description 
  var description_p: String = String()

  /// Descriptions of everything the thing can do 
  var actions: [ONActionDescription] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// An action is something a thing can do like unlocking a door or turning on the lights
/// Some actions might require input parameters (example: dim the light to 30%, open the door for 10 seconds).
/// It is also possible to demand information about the end user requesting the action in order to
/// implement access control. 
struct ONActionDescription {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Identifies the action within the thing it is attached to 
  var id: String = String()

  /// A human readable description of the action 
  var description_p: String = String()

  /// The adapter can require information about the actor / person behind the
  /// request to execute an action. Based on this information it can decide to
  /// deny the request. 
  var requiredActorProfileParameters: [ONRequiredActorProfileParameter] = []

  /// Description of the input parameters for this operation 
  var requiredInputParameters: [ONRequiredInputParameter] = []

  /// Some actions might produce output parameters like access codes 
  var outputParameters: [ONOutputParameter] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Some messages might be parameterized. For example changing the color of a light
/// bulb will probably require the user to choose the color. 
struct ONRequiredInputParameter {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Identifies the parameters, example: color, duration.. 
  var property: String = String()

  /// An optional, human readable description of the parameter 
  var description_p: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Describes an output parameter for an action.
/// This can be things like access codes..
struct ONOutputParameter {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Identifies the property within the action
  var property: String = String()

  /// Short human readable description.
  var description_p: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Describes user information in order to execute an action 
struct ONRequiredActorProfileParameter {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The parameter 
  var parameter: ONActorProfileParameter = .nationalIDNumber

  /// A human readable message explaining why this information is required 
  var why: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "oslonokkelen.data"

extension ONActorProfileParameter: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NATIONAL_ID_NUMBER"),
    1: .same(proto: "PHONE_NUMBER"),
    2: .same(proto: "EMAIL_ADDRESS"),
    3: .same(proto: "FULL_NAME"),
  ]
}

extension ONState: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "YES"),
    1: .same(proto: "NO"),
    2: .same(proto: "UNKNOWN"),
  ]
}

extension ONActionHealthStatus: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ActionHealthStatus"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "thingId"),
    2: .same(proto: "actionId"),
    3: .same(proto: "status"),
    4: .same(proto: "code"),
    5: .same(proto: "message"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.thingID)
      case 2: try decoder.decodeSingularStringField(value: &self.actionID)
      case 3: try decoder.decodeSingularEnumField(value: &self.status)
      case 4: try decoder.decodeSingularStringField(value: &self.code)
      case 5: try decoder.decodeSingularStringField(value: &self.message)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.thingID.isEmpty {
      try visitor.visitSingularStringField(value: self.thingID, fieldNumber: 1)
    }
    if !self.actionID.isEmpty {
      try visitor.visitSingularStringField(value: self.actionID, fieldNumber: 2)
    }
    if self.status != .working {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 3)
    }
    if !self.code.isEmpty {
      try visitor.visitSingularStringField(value: self.code, fieldNumber: 4)
    }
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONActionHealthStatus, rhs: ONActionHealthStatus) -> Bool {
    if lhs.thingID != rhs.thingID {return false}
    if lhs.actionID != rhs.actionID {return false}
    if lhs.status != rhs.status {return false}
    if lhs.code != rhs.code {return false}
    if lhs.message != rhs.message {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONActionHealthStatus.Status: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "WORKING"),
    1: .same(proto: "BROKEN"),
    2: .same(proto: "UNAVAILABLE"),
    3: .same(proto: "UNKNOWN"),
  ]
}

extension ONPropertyUpdate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PropertyUpdate"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "thingId"),
    2: .same(proto: "propertyId"),
    3: .same(proto: "batteryLevel"),
    4: .same(proto: "locked"),
    5: .same(proto: "open"),
    6: .same(proto: "statusMessage"),
    7: .same(proto: "signalStrength"),
    100: .same(proto: "other"),
  ]

  fileprivate class _StorageClass {
    var _thingID: String = String()
    var _propertyID: String = String()
    var _update: ONPropertyUpdate.OneOf_Update?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _thingID = source._thingID
      _propertyID = source._propertyID
      _update = source._update
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &_storage._thingID)
        case 2: try decoder.decodeSingularStringField(value: &_storage._propertyID)
        case 3:
          var v: ONPropertyUpdate.BatteryLevel?
          if let current = _storage._update {
            try decoder.handleConflictingOneOf()
            if case .batteryLevel(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._update = .batteryLevel(v)}
        case 4:
          var v: ONPropertyUpdate.Locked?
          if let current = _storage._update {
            try decoder.handleConflictingOneOf()
            if case .locked(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._update = .locked(v)}
        case 5:
          var v: ONPropertyUpdate.Open?
          if let current = _storage._update {
            try decoder.handleConflictingOneOf()
            if case .open(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._update = .open(v)}
        case 6:
          var v: ONPropertyUpdate.StatusMessage?
          if let current = _storage._update {
            try decoder.handleConflictingOneOf()
            if case .statusMessage(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._update = .statusMessage(v)}
        case 7:
          var v: ONPropertyUpdate.Signal?
          if let current = _storage._update {
            try decoder.handleConflictingOneOf()
            if case .signalStrength(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._update = .signalStrength(v)}
        case 100:
          var v: ONPropertyUpdate.Other?
          if let current = _storage._update {
            try decoder.handleConflictingOneOf()
            if case .other(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._update = .other(v)}
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._thingID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._thingID, fieldNumber: 1)
      }
      if !_storage._propertyID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._propertyID, fieldNumber: 2)
      }
      switch _storage._update {
      case .batteryLevel(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      case .locked(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      case .open(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      case .statusMessage(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      case .signalStrength(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
      case .other(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 100)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONPropertyUpdate, rhs: ONPropertyUpdate) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._thingID != rhs_storage._thingID {return false}
        if _storage._propertyID != rhs_storage._propertyID {return false}
        if _storage._update != rhs_storage._update {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONPropertyUpdate.BatteryLevel: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = ONPropertyUpdate.protoMessageName + ".BatteryLevel"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "percent"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt32Field(value: &self.percent)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.percent != 0 {
      try visitor.visitSingularUInt32Field(value: self.percent, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONPropertyUpdate.BatteryLevel, rhs: ONPropertyUpdate.BatteryLevel) -> Bool {
    if lhs.percent != rhs.percent {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONPropertyUpdate.Locked: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = ONPropertyUpdate.protoMessageName + ".Locked"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "state"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.state)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.state != .yes {
      try visitor.visitSingularEnumField(value: self.state, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONPropertyUpdate.Locked, rhs: ONPropertyUpdate.Locked) -> Bool {
    if lhs.state != rhs.state {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONPropertyUpdate.Open: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = ONPropertyUpdate.protoMessageName + ".Open"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "state"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.state)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.state != .yes {
      try visitor.visitSingularEnumField(value: self.state, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONPropertyUpdate.Open, rhs: ONPropertyUpdate.Open) -> Bool {
    if lhs.state != rhs.state {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONPropertyUpdate.StatusMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = ONPropertyUpdate.protoMessageName + ".StatusMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "message"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.message)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONPropertyUpdate.StatusMessage, rhs: ONPropertyUpdate.StatusMessage) -> Bool {
    if lhs.message != rhs.message {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONPropertyUpdate.Signal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = ONPropertyUpdate.protoMessageName + ".Signal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "percent"),
    3: .same(proto: "dBm"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.type)
      case 2: try decoder.decodeSingularUInt32Field(value: &self.percent)
      case 3: try decoder.decodeSingularSInt32Field(value: &self.dBm)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.type != .wifi {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 1)
    }
    if self.percent != 0 {
      try visitor.visitSingularUInt32Field(value: self.percent, fieldNumber: 2)
    }
    if self.dBm != 0 {
      try visitor.visitSingularSInt32Field(value: self.dBm, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONPropertyUpdate.Signal, rhs: ONPropertyUpdate.Signal) -> Bool {
    if lhs.type != rhs.type {return false}
    if lhs.percent != rhs.percent {return false}
    if lhs.dBm != rhs.dBm {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONPropertyUpdate.Signal.Radio: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "WIFI"),
    1: .same(proto: "BLUETOOTH"),
    2: .same(proto: "GSM"),
    3: .same(proto: "ZIGBEE"),
    4: .same(proto: "ZWAVE"),
    5: .same(proto: "LORA"),
  ]
}

extension ONPropertyUpdate.Other: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = ONPropertyUpdate.protoMessageName + ".Other"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "value"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.value)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONPropertyUpdate.Other, rhs: ONPropertyUpdate.Other) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONThingDescription: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ThingDescription"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "description"),
    3: .same(proto: "actions"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.description_p)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.actions)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.actions.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.actions, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONThingDescription, rhs: ONThingDescription) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.actions != rhs.actions {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONActionDescription: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ActionDescription"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "description"),
    3: .same(proto: "requiredActorProfileParameters"),
    4: .same(proto: "requiredInputParameters"),
    5: .same(proto: "outputParameters"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.description_p)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.requiredActorProfileParameters)
      case 4: try decoder.decodeRepeatedMessageField(value: &self.requiredInputParameters)
      case 5: try decoder.decodeRepeatedMessageField(value: &self.outputParameters)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.requiredActorProfileParameters.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.requiredActorProfileParameters, fieldNumber: 3)
    }
    if !self.requiredInputParameters.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.requiredInputParameters, fieldNumber: 4)
    }
    if !self.outputParameters.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.outputParameters, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONActionDescription, rhs: ONActionDescription) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.requiredActorProfileParameters != rhs.requiredActorProfileParameters {return false}
    if lhs.requiredInputParameters != rhs.requiredInputParameters {return false}
    if lhs.outputParameters != rhs.outputParameters {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONRequiredInputParameter: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RequiredInputParameter"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "property"),
    2: .same(proto: "description"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.property)
      case 2: try decoder.decodeSingularStringField(value: &self.description_p)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.property.isEmpty {
      try visitor.visitSingularStringField(value: self.property, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONRequiredInputParameter, rhs: ONRequiredInputParameter) -> Bool {
    if lhs.property != rhs.property {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONOutputParameter: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".OutputParameter"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "property"),
    2: .same(proto: "description"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.property)
      case 2: try decoder.decodeSingularStringField(value: &self.description_p)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.property.isEmpty {
      try visitor.visitSingularStringField(value: self.property, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONOutputParameter, rhs: ONOutputParameter) -> Bool {
    if lhs.property != rhs.property {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ONRequiredActorProfileParameter: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RequiredActorProfileParameter"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "parameter"),
    2: .same(proto: "why"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.parameter)
      case 2: try decoder.decodeSingularStringField(value: &self.why)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.parameter != .nationalIDNumber {
      try visitor.visitSingularEnumField(value: self.parameter, fieldNumber: 1)
    }
    if !self.why.isEmpty {
      try visitor.visitSingularStringField(value: self.why, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ONRequiredActorProfileParameter, rhs: ONRequiredActorProfileParameter) -> Bool {
    if lhs.parameter != rhs.parameter {return false}
    if lhs.why != rhs.why {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}