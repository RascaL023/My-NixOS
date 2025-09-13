package jsoncgen.apps;
import jsoncgen.tools.ConfigSetter;

public class Cava extends ConfigSetter{
    public Cava(String path){
        parseTemplate(path);
        initDefaults();
    }

    @Override
    protected void initDefaults(){
        set("gradient1", "#4B0082");
        set("gradient2", "#8A2BE2");
        set("gradient3", "#BA55D3");
        set("gradient4", "#DA70D6");
        set("gradient5", "#D8BFD9");
    }
}
