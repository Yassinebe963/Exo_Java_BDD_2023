import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.net.InetSocketAddress;

public class WebServer {
    public static void main(String[] args) throws IOException {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/ascii-art", new AsciiArtHandler());
        server.setExecutor(null);
        server.start();
        System.out.println("Server started on port 8080");
    }
}
