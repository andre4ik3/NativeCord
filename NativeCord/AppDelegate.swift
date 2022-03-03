import Cocoa
import WebKit

@main
class AppDelegate: NSObject, NSApplicationDelegate, WKNavigationDelegate {

    @IBOutlet var window: NSWindow!
    @IBOutlet var webview: WKWebView!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Load our custom helper js file
        let scriptURL = Bundle.main.url(forResource: "Helpers", withExtension: "js")!
        let scriptCode = try! String(contentsOf: scriptURL)
        let script = WKUserScript(source: scriptCode, injectionTime: .atDocumentStart, forMainFrameOnly: false)

        // Set up webview
        webview.navigationDelegate = self
        webview.configuration.userContentController.addUserScript(script)

        // Load the page
        let request = URLRequest(url: URL(string: "https://www.discord.com/app")!)
        webview.load(request)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if host == "www.discord.com" || host == "discord.com" {
                decisionHandler(.allow)
                return
            }
        }

        decisionHandler(.cancel)
    }
}
