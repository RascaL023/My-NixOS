package jsoncgen.tools;

public class Theme {
    private String name, bg, fg;
    
    public Theme(String themeName, String background, String foreground){
        this.name = themeName;
        this.bg = background;
        this.fg = foreground;
    }

    // Getter
    public String getName() { return name; }
    public String getBg() { return bg; }
    public String getFg() { return fg; }

    // Setter
    public void setBg(String background) { this.bg = background; }
    public void setFg(String foreground) { this.fg = foreground; }
}