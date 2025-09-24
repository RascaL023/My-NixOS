package jsoncgen.apps;
import jsoncgen.tools.ConfigSetter;

public abstract class Waybar extends ConfigSetter {
    public Waybar(String templatePath, String name, boolean key) {
        super(templatePath, name, key);
        if(key) initDefaults();
    }

    // Static Inner class(Layout)
    public static class Mine extends Waybar{
        public Mine(String path, boolean key){
            super(path, "mine", key);
        }

        @Override
        protected void initDefaults() {
            set("waybarBg", "unset");
            set("waybarFontSize", "10px");
            set("waybarFg", "#cfa3e9");
            set("modulesBg", "rgba(49, 50, 68, 0.8)");
            set("modulesBorderRadius", "20px");
            set("modulesBorder", "2px solid #b86fd4");
            set("tooltipBg", "rgba(30, 30, 46, 0.95)");
            set("tooltipBorderRadius", "6px");
            set("moduleHoverFg", "white");
            set("workspacesBtn", "#cdd6f4");
            set("workspacesActiveBg", "#b86fd4");
            set("workspacesActiveFg", "#1e1e2e");
        }
    }

    public static class Mechabox extends Waybar{
        public Mechabox(String path, boolean key){
            super(path, "mechabox", key);
        }

        @Override
        protected void initDefaults() {
            set("rosewater", "#f2e6ff");
            set("flamingo", "#e6ccff");
            set("pink", "#d9b3ff");
            set("mauve", "#c299ff");
            set("red", "#b366ff");
            set("maroon", "#9933ff");
            set("peach", "#bf80ff");
            set("yellow", "#cc99ff");
            set("green", "#aa88ff");
            set("teal", "#9570ff");
            set("sky", "#8c66ff");
            set("sapphire", "#8056ff");
            set("blue", "#734cff");
            set("lavender", "#b380ff");
            set("text", "#e0d6f7");
            set("subtext1", "#cbbde6");
            set("subtext0", "#b3a3d6");
            set("overlay2", "#9c8cc2");
            set("overlay1", "#8575ad");
            set("overlay0", "#6e5f99");
            set("surface2", "#594d80");
            set("surface1", "#443966");
            set("surface0", "#33294d");
            set("base", "#221933");
            set("mantle", "#1a1226");
            set("crust", "#120d1a");

            set("main-br", "@subtext0");
            set("main-bg", "@crust");
            set("main-fg", "@text");
            set("accent", "@mauve");
            set("hover-bg", "alpha(@mauve, 0.15)");
            set("hover-fg", "@lavender");
            set("outline", "alpha(@lavender, 0.5)");
            set("workspaces", "@mantle");
            set("temperature", "@mantle");
            set("memory", "@base");
            set("cpu", "@surface0");
            set("time", "@surface0");
            set("date", "@base");
            set("tray", "@mantle");
            set("volume", "@mantle");
            set("backlight", "@base");
            set("battery", "@surface0");
            set("warning", "#ff80ff");
            set("critical", "#cc33ff");
            set("charging", "#aa66ff");
        }
    }
}
