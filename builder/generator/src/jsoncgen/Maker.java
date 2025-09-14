package jsoncgen;
import jsoncgen.tools.Theme;
import jsoncgen.apps.*;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import java.util.LinkedHashMap;
import java.util.Map;


public class Maker {
    Scanner inp =  new Scanner(System.in);
    final String rootPath = "/home/rascal/.dotfiles/themes/base/";
    public Maker(String[] params){
        // Buat theme global
        Theme theme = new Theme(params[1]);

        // Buat semua apps
        String temp = "config.template";
        Waybar waybar = new Waybar(rootPath + "waybar/mine/" + temp);
        Kitty kitty = new Kitty(rootPath + "kitty/" + temp);
        Cava cava = new Cava(rootPath + "cava/" + temp);
        Gtk3 gtk3 = new Gtk3(rootPath + "gtk-3.0/" + temp);
        Hyprland hyprland = new Hyprland(rootPath + "hyprland/" + temp);

        // Tampilkan hasil
        System.out.println("== Theme ==");
        System.out.println("Nama Tema : " + theme.getName());
        // System.out.println("Background : " + theme.getBg());
        // System.out.println("Foreground : " + theme.getFg());

        // System.out.println("\n== Waybar Config ==");
        // waybar.getAll().forEach((k, v) -> System.out.println(k + " : " + v));

        // System.out.println("\n== Kitty Config ==");
        // kitty.getAll().forEach((k, v) -> System.out.println(k + " : " + v));

        // System.out.println("\n== Cava Config ==");
        // cava.getAll().forEach((k, v) -> System.out.println(k + " : " + v));

        // System.out.println("\n== Hyprland Config ==");
        // hyprland.getAll().forEach((k, v) -> System.out.println(k + " : " + v));

        // System.out.println("\n== GTK-3.0 Config ==");
        // gtk3.getAll().forEach((k, v) -> System.out.println(k + " : " + v));

        System.out.print("Apakah Anda yakin? ");
        if(inp.nextInt() != 1){
            System.out.println("Config Dibatalkan...");
            return;
        }

        Map<String, Object> allApps = new LinkedHashMap<>();
        allApps.put("waybar", waybar.getAll());
        allApps.put("kitty", kitty.getAll());
        allApps.put("cava", cava.getAll());
        allApps.put("gtk-3.0", gtk3.getAll());
        allApps.put("hyprland", hyprland.getAll());

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        try (FileWriter writer = new FileWriter(params[0] + "/" + params[1] + "/" + "theme.json")) {
            gson.toJson(allApps, writer);
            System.out.println(">> JSON berhasil dibuat di " + params[0]);
        } catch (IOException e) { e.printStackTrace(); }
    }
}
