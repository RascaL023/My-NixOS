package jsoncgen.apps;
import jsoncgen.tools.ConfigSetter;

public class Kitty extends ConfigSetter {
    public Kitty(String templatePath, boolean key) {
        super(templatePath, "Kitty", key);
        if(key) initDefaults();
    }

    @Override
    protected void initDefaults() {
        set("cursor", "#AC82E9");
        set("bg", "#000000");
        set("fg", "#d8cab8");
        set("selectBg", "#b86fd4");
        set("selectFg", "#141216");
        set("color0", "#2b2135");
        set("color8", "#92fcfa");
        set("color1", "#fc4649");        
        set("color9", "#fc4649");        
        set("color2", "#c4e881");        
        set("color10", "#c4e881");
        set("color3", "#AC82E9");
        set("color11", "#AC82E9");
        set("color4", "#7b91fc");        
        set("color12", "#7b91fc");        
        set("color5", "#f3fc7b");        
        set("color13", "#f3fc7b");        
        set("color6", "#8F56E1");        
        set("color14", "#8F56E1");
        set("color7", "#fc92fc");
        set("color15", "#d8cab8");
    }
}
