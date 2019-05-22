import Foundation

extension URLRequest {
    public mutating func setMultipartFormData(_ parameters: [String: String]) throws {
        
        let makeRandom = { UInt32.random(in: (.min)...(.max)) }
        let boundary = String(format: "------------------------%08X%08X", makeRandom(), makeRandom())
        
        addValue("multipart/form-data; charset=utf-8; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let body = parameters.reduce("") { (result, keyValue) -> String in
            return result +
            """
            --\(boundary)
            Content-Disposition: form-data; name="\(keyValue.key)"\n
            \(keyValue.value)\n
            """
        } + "--\(boundary)--"
        
        httpBody = body.data(using: .utf8)
    }
}
