package jsoncgen.apps;
import jsoncgen.tools.ConfigSetter;

public class Gtk3 extends ConfigSetter{
    public Gtk3(String path, boolean key){
        super(path, "Gtk3", key);
        if(key) initDefaults();
    }

    @Override
    protected void initDefaults(){
        set("nemoBg", "rgba(0, 0, 0, 0.65)");
        set("toolbar", "rgba(0, 0, 0, 0.3)");
        set("view", "transparent");
    }
}
