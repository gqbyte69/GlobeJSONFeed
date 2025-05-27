//
//  API.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/25/25.
//

import Foundation

enum HTTPMethod: String {
  case GET
  case POST
  case PUT
  case DELETE
}

class API {
  private let baseURL: URL
  private let version: String
  private let appConfig: AppConfigProtocol

  var rapidApiHeaders: [String: String] {
    [:]
//    [
//      "x-rapidapi-key": appConfig.secrets.rapidApiKey,
//      "x-rapidapi-host": appConfig.secrets.rapidApiHost
//    ]
  }

  init(
    baseURL: URL,
    version: String,
    appConfig: AppConfigProtocol = App.shared.config
  ) {
    self.baseURL = baseURL
    self.version = version
    self.appConfig = appConfig
  }

  func endpointURL(_ resourcePath: String) -> URL {
    baseURL.appendingPathComponent("\(version)\(resourcePath)")
  }

  /// Performs an asynchronous HTTP request and decodes the response into a generic model.
  ///
  /// - Parameters:
  ///   - url: The endpoint URL string.
  ///   - method: The HTTP method to use (GET, POST, etc).
  ///   - parameters: A dictionary of parameters to include in the request. For GET, they are appended as query parameters; for other methods, they are sent in the body as JSON.
  ///   - headers: A dictionary of HTTP headers to include in the request.
  ///   - responseType: The expected response type that conforms to `Decodable`.
  ///
  /// - Returns: A decoded model of type `T`.
  ///
  /// - Throws: An error if the request fails, the response status code is not in the 2xx range, or decoding fails.
  func request<T: Decodable>(
    url: String,
    method: HTTPMethod,
    parameters: [String: Any] = [:],
    headers: [String: String] = [:],
    responseType: T.Type
  ) async throws -> T {
    let endpointURL = endpointURL(url)

    guard
      var urlComponents = URLComponents(
        url: endpointURL,
        resolvingAgainstBaseURL: false
      )
    else {
      throw URLError(.badURL)
    }

    var request: URLRequest

    if method == .GET, !parameters.isEmpty {
      urlComponents.queryItems = parameters.map {
        URLQueryItem(name: $0.key, value: "\($0.value)")
      }
    }

    guard let finalURL = urlComponents.url else {
      throw URLError(.badURL)
    }

    request = URLRequest(url: finalURL)
    request.httpMethod = method.rawValue

    if method != .GET {
      request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }

    for (key, value) in headers {
      request.setValue(value, forHTTPHeaderField: key)
    }

    logRequest(request: request)

    let (data, response) = try await URLSession.shared.data(for: request)

    if let httpResponse = response as? HTTPURLResponse {
      logResponse(response: httpResponse)
    }

    guard
      let httpResponse = response as? HTTPURLResponse,
      200 ..< 300 ~= httpResponse.statusCode
    else {
      throw URLError(.badServerResponse)
    }

    return try JSONDecoder().decode(T.self, from: data)
  }
}

// MARK: - Helpers

private extension API {
  func logRequest(request: URLRequest) {
    debugPrint("📤 Request:")
    debugPrint("➡️ URL: \(request.url?.absoluteString ?? "nil")")
    debugPrint("➡️ Method: \(request.httpMethod ?? "nil")")
    debugPrint("➡️ Headers: \(request.allHTTPHeaderFields ?? [:])")
  }

  func logResponse(response: HTTPURLResponse) {
    debugPrint("📥 Response:")
    debugPrint("⬅️ Status Code: \(response.statusCode)")
    debugPrint("⬅️ Headers: \(response.allHeaderFields)")
  }
}
