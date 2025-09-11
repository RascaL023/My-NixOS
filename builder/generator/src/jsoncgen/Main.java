package jsoncgen;
import jsoncgen.tools.Theme;

public class Main {
    public static void main(String[] args) {
        Theme themes = new Theme("#efefef", "#efffef", "#aaafaa");

        System.out.println(themes.primary);
        System.out.println(themes.background);
        System.out.println(themes.text);
    }
}