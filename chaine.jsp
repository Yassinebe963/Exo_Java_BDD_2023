public class ChaineManipulation {

    public static void main(String[] args) {
        String bonjour = "salut la compagnie";
        
        // Afficher la chaîne en majuscules
        System.out.println("Chaîne en majuscules: " + bonjour.toUpperCase());
        
        // Afficher la chaîne avec première lettre en majuscule
        System.out.println("Première lettre en majuscule: " + premiereLettreMajuscule(bonjour));
    }
    
    /**
     * Méthode qui met la première lettre d'une chaîne en majuscule
     * @param chaine la chaîne à transformer
     * @return la chaîne avec première lettre en majuscule
     */
    public static String premiereLettreMajuscule(String chaine) {
        if (chaine == null || chaine.isEmpty()) {
            return chaine;
        }
        return chaine.substring(0, 1).toUpperCase() + chaine.substring(1);
    }
}
