public class Main {
    public static void main(String[] args) {
        // Déclaration de la chaîne
        String bonjour = "salut la compagnie";
        
        // Affichage en majuscules
        System.out.println("En majuscules: " + bonjour.toUpperCase());
        
        // Affichage avec première lettre en majuscule
        System.out.println("Première lettre en majuscule: " + capitalizeFirstLetter(bonjour));
    }
    
    /**
     * Met uniquement la première lettre d'une chaîne en majuscule
     * @param str la chaîne à transformer
     * @return la chaîne avec première lettre en majuscule
     */
    public static String capitalizeFirstLetter(String str) {
        if (str == null || str.isEmpty()) {
            return str;
        }
        return str.substring(0, 1).toUpperCase() + str.substring(1).toLowerCase();
    }
}
