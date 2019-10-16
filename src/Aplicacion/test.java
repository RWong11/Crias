package Aplicacion;

import com.kingaspx.util.BrowserUtil;
import com.kingaspx.version.Version;
import com.teamdev.jxbrowser.chromium.*;
import com.teamdev.jxbrowser.chromium.swing.BrowserView;
import com.teamdev.jxbrowser.chromium.swing.DefaultNetworkDelegate;

import javax.swing.*;
import java.awt.*;
import java.nio.charset.Charset;
import java.util.logging.Level;

/**
 * This sample demonstrates how to capture response body of HTTP request.
 */
public class test {
    public static void main(final String[] args) {
    	BrowserUtil.setVersion(Version.V6_22);
        LoggerProvider.setLevel(Level.OFF);

        BrowserContext browserContext = BrowserContext.defaultContext();
        NetworkService networkService = browserContext.getNetworkService();
        networkService.setNetworkDelegate(new DefaultNetworkDelegate() {
            @Override
            public void onDataReceived(DataReceivedParams params) {
                if (params.getMimeType().equals("text/html")) {
                    String data = new String(params.getData(),
                            Charset.forName("UTF-8"));
                    System.out.println("data = " + data);
                }
            }
        });

        Browser browser = new Browser(browserContext);
        BrowserView view = new BrowserView(browser);

        JFrame frame = new JFrame();
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.add(view, BorderLayout.CENTER);
        frame.setSize(700, 500);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);

        browser.loadURL("https://www.wikipedia.org/");
    }
}