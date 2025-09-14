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

// fungsi untuk replace sederhana
char *replace_placeholder(const char *template, const char *key, const char *value) {
    char placeholder[64];
    snprintf(placeholder, sizeof(placeholder), "${%s}", key);

    const char *pos = strstr(template, placeholder);
    if (!pos) return strdup(template);

    size_t before_len = pos - template;
    size_t after_len = strlen(pos + strlen(placeholder));
    size_t new_len = before_len + strlen(value) + after_len;

    char *result = malloc(new_len + 1);
    strncpy(result, template, before_len);
    strcpy(result + before_len, value);
    strcpy(result + before_len + strlen(value), pos + strlen(placeholder));

    return result;
}

char *build_path(const char *fmt, const char *a, const char *b) {
    char *out = NULL;
    if (asprintf(&out, fmt, a, b) == -1) return NULL;
    return out;
}