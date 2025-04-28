public class Tache {
    private String description;
    private boolean estTerminee;

    public Tache(String description) {
        this.description = description;
        this.estTerminee = false; // Par défaut, non terminée
    }

    // Getters & Setters
    public String getDescription() { return description; }
    public boolean estTerminee() { return estTerminee; }
    public void marquerTerminee() { estTerminee = true; }

    @Override
    public String toString() {
        return "[" + (estTerminee ? "✓" : " ") + "] " + description;
    }
}
