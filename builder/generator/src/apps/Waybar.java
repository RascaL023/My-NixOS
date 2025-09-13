package jsoncgen.apps;
import jsoncgen.tools.ConfigSetter;

public class Waybar extends ConfigSetter {
    public Waybar(String templatePath) {
        parseTemplate(templatePath);
        initDefaults();
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
