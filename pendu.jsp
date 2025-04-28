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
