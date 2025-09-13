package jsoncgen.tools;
import java.util.HashMap;
import java.util.Map;
import java.io.IOException;
import java.nio.file.*;
import java.util.regex.*;
import java.util.Scanner;

public abstract class ConfigSetter {
    public Map<String, String> props = new HashMap<>();
    public Scanner input = new Scanner(System.in);

    public void set(String key, String value) {
        props.put(key, value);
    }

    public String get(String key) {
        return props.get(key);
    }

    public Map<String, String> getAll() {
        return props;
    }

    public void parseTemplate(String templatePath) {
        try {
            String content = Files.readString(Paths.get(templatePath));

            Pattern pattern = Pattern.compile("\\$\\{(.*?)}");
            Matcher matcher = pattern.matcher(content);

            while (matcher.find()) {
                String key = matcher.group(1);
                props.putIfAbsent(key, ""); // default kosong (isi nanti di initDefaults)
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // biar tiap app bisa punya init default config
    protected abstract void initDefaults();

    public void askUserInput() {
        for (String key : props.keySet()) {
            System.out.print("Input " + key + " [" + props.get(key) + "]: ");
            String value = input.nextLine();
            if (!value.isEmpty()) {
                props.put(key, value);
            }
        }
    }
}
