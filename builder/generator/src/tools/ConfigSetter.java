package jsoncgen.tools;
import java.util.LinkedHashMap;
import java.util.Map;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.*;
import java.util.regex.*;
import java.util.Scanner;

public abstract class ConfigSetter {
    private String name;

    public ConfigSetter(String path, String name, boolean key){
        this.name = name;
        if(key) parseTemplate(path);
        else loadPalette(path);
    }

    public Map<String, String> props = new LinkedHashMap<>();
    public Scanner input = new Scanner(System.in);

    public void set(String key, String value) { props.put(key, value); }
    public String get(String key) { return props.get(key); }

    public void setName(String name){ this.name = name; }
    public String getName(){ return name; }

    public Map<String, String> getAll() { return props; }

    public void parseTemplate(String templatePath) {
        try {
            String content = Files.readString(Paths.get(templatePath));

            Pattern pattern = Pattern.compile("\\$\\{(.*?)}");
            Matcher matcher = pattern.matcher(content);

            while (matcher.find()) {
                String key = matcher.group(1);
                props.putIfAbsent(key, ""); // default kosong (isi nanti di initDefaults)
            }
        } catch (IOException e) { e.printStackTrace(); }
    }

    // 🔹 Load dari palette file
    public void loadPalette(String path) {
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = br.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty() || line.startsWith("#")) continue;

                String[] parts = line.split(":", 2);
                if (parts.length < 2) continue;

                String key = parts[0].trim();
                String value = parts[1].trim();

                if (value.endsWith(";")) value = value.substring(0, value.length() - 1).trim();
                
                set(key, value);
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
            if (!value.isEmpty()) props.put(key, value);
        }
    }

    public void printDetail(){
        System.out.printf("\n\n== %s Config ==\n", name);
        getAll().forEach((k, v) -> System.out.println(k + " : " + v));
    }
}
