package jsoncgen;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);

        System.out.println(">> Proses dimulai");
        System.out.printf("Apakah Anda ingin input config manual?");
        
        new Maker(args, inp.nextInt());
    }
}