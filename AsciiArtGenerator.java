public class AsciiArtGenerator {
    public static String generateAsciiArt(String text, int height, String[] alphabet) {
        StringBuilder result = new StringBuilder();
        
        for (int i = 0; i < height; i++) {
            for (char c : text.toUpperCase().toCharArray()) {
                int index = c - 'A';
                if (index >= 0 && index < alphabet.length) {
                    result.append(alphabet[index].substring(i * height, (i + 1) * height));
                } else {
                    // Caractère non reconnu
                    result.append(alphabet[alphabet.length - 1].substring(i * height, (i + 1) * height));
                }
            }
            result.append("\n");
        }
        
        return result.toString();
    }
}
