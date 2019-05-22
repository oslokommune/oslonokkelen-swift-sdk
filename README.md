# oslonokkelen-swift-sdk

Swift SDK for Oslonøkkelen (proof of concept)

## Prerequisites

- [oslonokkelen-swift-sdk](https://github.com/oslokommune/oslonokkelen-swift-sdk)
    - `git clone git@github.com:oslokommune/oslonokkelen-swift-sdk.git`
- [oslonokkelen-java-sdk](https://github.com/oslokommune/oslonokkelen-java-sdk) for test/mock server
    - `git clone git@github.com:oslokommune/oslonokkelen-java-sdk.git`
- [swift-protobuf](https://github.com/apple/swift-protobuf) for development
    - `brew install swift-protobuf`

## Running

### Test/mock server
```
cd oslonokkelen-java-sdk
./gradlew :development-server:shadowJar
java -jar development-server/build/libs/development-server.jar 0.0.0.0 4000 4001
```

You can now open http://localhost:4001/ and see all the connected adapters.

### Swift example
```
cd oslonokkelen-swift-sdk
swift run Example
```

You may add more things and actions in [MyAdapter.swift](Sources/Example/MyAdapter.swift#L37)

## Development
```
swift package generate-xcodeproj
open OslonokkelenSDK.xcodeproj
```

The SDK it self is located inside [OslonokkelenSDK](Sources/OslonokkelenSDK/) folder

## Protobuf specification
Defines the messages that are sent between client and backend. 

The messages are defined with protobuf making it easy to generate efficient code for most languages. 

1. [messages.proto](https://github.com/oslokommune/oslonokkelen-java-sdk/blob/master/messages/src/main/proto/messages.proto) - Defines the messages being sent between the server and adapter.
1. [data.proto](https://github.com/oslokommune/oslonokkelen-java-sdk/blob/master/messages/src/main/proto/data.proto) - Defines data types used in the messages. 

### Rebuild protobuf files
Download both proto files mentioned above. You need to add `option swift_prefix="ON";` to both the files to get a cleaner prefix in the classes/structs when running the swift generator.
```
protoc --swift_out=. data.proto messages.proto
```
Put the newly generated files into the [Protobuf](Sources/OslonokkelenSDK/Model/Protobuf/) folder.
