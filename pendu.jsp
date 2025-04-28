import java.util.Random;
import java.util.ArrayList;

public class JeuPendu {
    private String motSecret;
    private char[] motMasque;
    private int essaisRestants;
    private ArrayList<Character> lettresProposees;

    public JeuPendu() {
        String[] mots = {"JAVA", "POO", "PROGRAMMATION", "CLASS", "METHODE", "OBJET", "HERITAGE", "INTERFACE", "COMPILATEUR", "DEVELOPPEUR"};
        this.motSecret = mots[new Random().nextInt(mots.length)];
        this.motMasque = new char[motSecret.length()];
        Arrays.fill(motMasque, '_');
        this.essaisRestants = 6;
        this.lettresProposees = new ArrayList<>();
    }

    public boolean proposerLettre(char lettre) {
        lettre = Character.toUpperCase(lettre);
        if (lettresProposees.contains(lettre)) return false;

        lettresProposees.add(lettre);
        boolean lettreTrouvee = false;
        for (int i = 0; i < motSecret.length(); i++) {
            if (motSecret.charAt(i) == lettre) {
                motMasque[i] = lettre;
                lettreTrouvee = true;
            }
        }
        if (!lettreTrouvee) essaisRestants--;
        return lettreTrouvee;
    }

    public boolean estGagne() {
        return new String(motMasque).equals(motSecret);
    }

    public String getMotMasque() {
        return new String(motMasque);
    }

    public int getEssaisRestants() {
        return essaisRestants;
    }

    public String getLettresProposees() {
        return lettresProposees.toString();
    }
}
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        JeuPendu jeu = new JeuPendu();
        Scanner scanner = new Scanner(System.in);

        System.out.println("=== JEU DU PENDU ===");
        while (jeu.getEssaisRestants() > 0 && !jeu.estGagne()) {
            System.out.println("\nMot: " + jeu.getMotMasque());
            System.out.println("Essais restants: " + jeu.getEssaisRestants());
            System.out.println("Lettres proposées: " + jeu.getLettresProposees());

            System.out.print("Proposez une lettre: ");
            char lettre = scanner.next().toUpperCase().charAt(0);

            if (!jeu.proposerLettre(lettre)) {
                System.out.println("Lettre incorrecte !");
            }
        }

        if (jeu.estGagne()) {
            System.out.println("\nFélicitations ! Le mot était: " + jeu.getMotMasque());
        } else {
            System.out.println("\nPerdu ! Le mot était: " + jeu.motSecret);
        }
        scanner.close();
    }
}
public static void afficherPendu(int essais) {
    String[] pendu = {
        "  ____\n |    |\n |    O\n |   /|\\\n |   / \\\n_|_",
        "  ____\n |    |\n |    O\n |   /|\\\n |   /\n_|_",
        "  ____\n |    |\n |    O\n |   /|\\\n |\n_|_",
        "  ____\n |    |\n |    O\n |   /|\n |\n_|_",
        "  ____\n |    |\n |    O\n |    |\n |\n_|_",
        "  ____\n |    |\n |    O\n |\n |\n_|_",
        "  ____\n |    |\n |\n |\n |\n_|_"
    };
    System.out.println(pendu[6 - essais]);
}
System.out.print("Voulez-vous rejouer ? (O/N): ");
if (scanner.next().equalsIgnoreCase("O")) {
    main(args); // Relance le jeu
}
