package jsoncgen.apps;
import jsoncgen.tools.ConfigSetter;

public class Hyprland extends ConfigSetter{
    public Hyprland(String path){
        parseTemplate(path);
        initDefaults();
    }

    @Override
    protected void initDefaults(){
        set("gapsIn", "3");
        set("gapsOut", "5");
        set("borderSize", "2");
        set("activeBorder", "rgba(8f00ffee) rgba(33ccffee) 45deg");
        set("inactiveBorder", "rgba(0,0,0,0)");
        set("rounding", "10");
        set("shadow", "false");
        set("shadowRange", "6");
        set("shadowPower", "1");
        set("shadowColor", "rgba(0,255,255,0.4)");
    }
}
