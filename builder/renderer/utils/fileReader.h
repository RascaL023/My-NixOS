// Fungsi untuk membaca file ke string
char *read_file(const char *filename) {
    FILE *f = fopen(filename, "rb");
        if (!f) { perror("File open error"); return NULL; }

        fseek(f, 0, SEEK_END);
        long len = ftell(f);
        if(len < 0){ perror("Error, file kosong.."); return NULL; }

        rewind(f);
        char *data = malloc(len + 1);
        fread(data, 1, len, f); data[len] = '\0';
    fclose(f); return data; 
}
