package jsoncgen;
import jsoncgen.tools.Apps;
import jsoncgen.tools.Theme;
import jsoncgen.apps.Waybar;


public class Main {
    public static void main(String[] args) {
        // Buat theme global
        Theme theme = new Theme("Testing", "black", "white");

        // Buat semua apps
        Apps apps = new Apps();
        Waybar waybar = apps.getWaybar();

        // Tampilkan hasil
        System.out.println("== Theme ==");
        System.out.println("Nama Tema : " + theme.getName());
        System.out.println("Background : " + theme.getBg());
        System.out.println("Foreground : " + theme.getFg());

        System.out.println("\n== Waybar Config ==");
        waybar.getAll().forEach((k, v) -> 
            System.out.println(k + " : " + v)
        );
    }
}