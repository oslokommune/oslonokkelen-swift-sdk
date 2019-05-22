import Foundation

public struct AuthConfig {
    let url: URL
    let client_id: String
    let client_secret: String
    let grant_type: String
    
    public init(url: URL, client_id: String, client_secret: String, grant_type: String = "client_credentials") {
        self.url = url
        self.client_id = client_id
        self.client_secret = client_secret
        self.grant_type = grant_type
    }
}

class AuthService {
    let config: AuthConfig
    let session: URLSession
    
    init(config: AuthConfig) {
        self.config = config
        self.session = URLSession(configuration: .default)
    }
    
    func authorize(callback: @escaping (Result<Auth, Error>) -> ()) {
        var request = URLRequest(url: config.url)
        request.httpMethod = "POST"
        
        do {
            try request.setMultipartFormData(["client_id": config.client_id,
                                           "client_secret": config.client_secret,
                                           "grant_type": config.grant_type])
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    callback(.failure(error ?? OsloError.generic))
                    return
                }
                
                guard let auth = try? JSONDecoder().decode(Auth.self, from: data) else {
                    callback(.failure(OsloError.parsing))
                    return
                }
                
                callback(.success(auth))
                }.resume()
        } catch {
            callback(.failure(OsloError.formdata))
        }
    }
}

struct Auth: Decodable {
    let access_token: String
    let refresh_token: String
    let refresh_expires_in: Int
    let expires_in: Int
}
