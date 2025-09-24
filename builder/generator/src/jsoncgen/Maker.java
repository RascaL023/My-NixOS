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
    Scanner inp = new Scanner(System.in);
    final String template = "config.template";
    final String rootPath = "/home/rascal/.dotfiles/themes/base/";
    final String blueprintRootPath = "/home/rascal/.dotfiles/blueprint/";
    String selectedPath = "";

    // 🔑 Factory method buat ambil path
    private String resolvePath(String app, String file, int input) {
        if (input == 1) {
            return rootPath + app + "/" + file;
        } else {
            return blueprintRootPath + app + "/" + file;
        }
    }

    // 🔑 Factory method buat app
    private Waybar.Mine createWaybarMine(int input) {
        return new Waybar.Mine(
            resolvePath("waybar", input == 1 ? "/mine/style.css.template" : "mine - css.palette", input),
            input == 1
        );
    }

    private Waybar.Mechabox createWaybarMechabox(int input) {
        return new Waybar.Mechabox(
            resolvePath("waybar", input == 1 ? "/mechabox/source.css.template" : "mechabox - css.palette", input),
            input == 1
        );
    }

    private Kitty createKitty(int input) {
        return new Kitty(
            resolvePath("kitty", input == 1 ? template : "kitty.palette", input),
            input == 1
        );
    }

    private Cava createCava(int input) {
        return new Cava(
            resolvePath("cava", input == 1 ? template : "cava.palette", input),
            input == 1
        );
    }

    private Gtk3 createGtk3(int input) {
        return new Gtk3(
            resolvePath("gtk-3.0", input == 1 ? template : "gtk3.palette", input),
            input == 1
        );
    }

    private Hyprland createHyprland(int input) {
        return new Hyprland(
            resolvePath("hyprland", input == 1 ? template : "hyprland.palette", input),
            input == 1
        );
    }

    public Maker(String[] params, int input) {
        Theme theme = new Theme(params[1]);

        // 🔑 Buat semua apps lewat factory
        Waybar.Mine waybarMine = createWaybarMine(input);
        Waybar.Mechabox waybarMechabox = createWaybarMechabox(input);
        Kitty kitty = createKitty(input);
        Cava cava = createCava(input);
        Gtk3 gtk3 = createGtk3(input);
        Hyprland hyprland = createHyprland(input);

        System.out.println("JSON akan dibuat di " + params[0] + "/" + params[1]);
        System.out.print("Apakah Anda yakin? ");
        if (inp.nextInt() != 1) {
            System.out.println("Config Dibatalkan...");
            return;
        }

        
        Map<String, Object> waybarLayouts = new LinkedHashMap<>();
        waybarLayouts.put(waybarMine.getName(), waybarMine.getAll());
        waybarLayouts.put(waybarMechabox.getName(), waybarMechabox.getAll());

        Map<String, Object> allApps = new LinkedHashMap<>();
        allApps.put("waybar", waybarLayouts);
        allApps.put("kitty", kitty.getAll());
        allApps.put("cava", cava.getAll());
        allApps.put("gtk-3.0", gtk3.getAll());
        allApps.put("hyprland", hyprland.getAll());

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        try (FileWriter writer = new FileWriter(params[0] + "/" + params[1] + "/" + "theme.json")) {
            gson.toJson(allApps, writer);
            System.out.println(">> JSON berhasil dibuat di " + params[0]);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
