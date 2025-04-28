import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        GestionTaches gestion = new GestionTaches();
        Scanner scanner = new Scanner(System.in);
        int choix;

        do {
            System.out.println("\n--- � Gestionnaire de Tâches ---");
            System.out.println("1. ➕ Ajouter une tâche");
            System.out.println("2. 👀 Afficher les tâches");
            System.out.println("3. ✓ Marquer une tâche comme terminée");
            System.out.println("4. ❌ Quitter");
            System.out.print("Choix : ");
            choix = scanner.nextInt();
            scanner.nextLine(); // Nettoyer le buffer

            switch (choix) {
                case 1:
                    System.out.print("Description de la tâche : ");
                    String desc = scanner.nextLine();
                    gestion.ajouterTache(desc);
                    break;
                case 2:
                    gestion.afficherTaches();
                    break;
                case 3:
                    System.out.print("Numéro de la tâche à terminer : ");
                    int num = scanner.nextInt() - 1;
                    gestion.marquerTerminee(num);
                    break;
            }
        } while (choix != 4);

        System.out.println("👋 Au revoir !");
        scanner.close();
    }
}
