package jsoncgen.tools;

public class Theme {
    private String name;
    
    public Theme(String themeName){
        this.name = themeName;
        System.out.printf("\n== %s ==\n", this.name);
    }

    // Getter
    public String getName() { return name; }
}