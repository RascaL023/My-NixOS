package jsoncgen.tools;
import java.util.HashMap;
import java.util.Map;

public abstract class ConfigSetter {
    private Map<String, String> props = new HashMap<>();

    public void set(String key, String value) {
        props.put(key, value);
    }

    public String get(String key) {
        return props.get(key);
    }

    public Map<String, String> getAll() {
        return props;
    }

    // biar tiap app bisa punya init default config
    protected abstract void initDefaults();
}
