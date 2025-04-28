import java.util.ArrayList;
import java.util.List;

public class GestionTaches {
    private List<Tache> taches = new ArrayList<>();

    public void ajouterTache(String description) {
        taches.add(new Tache(description));
        System.out.println("✅ Tâche ajoutée !");
    }

    public void afficherTaches() {
        if (taches.isEmpty()) {
            System.out.println("Aucune tâche à afficher.");
        } else {
            System.out.println("📋 Liste des tâches :");
            for (int i = 0; i < taches.size(); i++) {
                System.out.println((i + 1) + ". " + taches.get(i));
            }
        }
    }

    public void marquerTerminee(int index) {
        if (index >= 0 && index < taches.size()) {
            taches.get(index).marquerTerminee();
            System.out.println("👍 Tâche marquée comme terminée !");
        } else {
            System.out.println("❌ Index invalide !");
        }
    }
}
