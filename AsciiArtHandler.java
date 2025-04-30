import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

public class AsciiArtHandler implements HttpHandler {
    private static final String[] ALPHABET = {
        // Patterns ASCII pour A-Z
        "  ___   / _ \\  | | | | | |_| |  \\___/  ",
        // ... autres lettres
        " _____  | ____| | |___  |_____| |_____| " // Pour les caractères inconnus
    };
    
    @Override
    public void handle(HttpExchange exchange) throws IOException {
        if ("GET".equals(exchange.getRequestMethod())) {
            // Afficher le formulaire
            String response = "<html><body>"
                + "<form method='POST'>"
                + "Texte: <input type='text' name='text'><br>"
                + "<input type='submit' value='Générer'>"
                + "</form>"
                + "</body></html>";
            
            exchange.sendResponseHeaders(200, response.length());
            OutputStream os = exchange.getResponseBody();
            os.write(response.getBytes());
            os.close();
        } else if ("POST".equals(exchange.getRequestMethod())) {
            // Traiter la requête POST
            String query = new String(exchange.getRequestBody().readAllBytes(), StandardCharsets.UTF_8);
            Map<String, String> params = parseQuery(query);
            String text = params.getOrDefault("text", "");
            
            String asciiArt = AsciiArtGenerator.generateAsciiArt(text, 5, ALPHABET);
            
            String response = "<html><body><pre>" + asciiArt + "</pre></body></html>";
            exchange.sendResponseHeaders(200, response.length());
            OutputStream os = exchange.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }
    
    private Map<String, String> parseQuery(String query) {
        Map<String, String> result = new HashMap<>();
        for (String param : query.split("&")) {
            String[] entry = param.split("=");
            if (entry.length > 1) {
                result.put(entry[0], URLDecoder.decode(entry[1], StandardCharsets.UTF_8));
            } else {
                result.put(entry[0], "");
            }
        }
        return result;
    }
}
