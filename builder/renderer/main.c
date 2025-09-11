#include "header.h"

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

// cari key di seluruh tree JSON (rekursif)
cJSON *find_json_key(cJSON *root, const char *key) {
    if (!root) return NULL;

    // kalau root punya nama dan sama dengan key → ketemu
    if (root->string && strcmp(root->string, key) == 0) {
        return root;
    }

    // kalau root punya child (object/array) → telusuri anaknya
    cJSON *child = root->child;
    while (child) {
        cJSON *found = find_json_key(child, key);
        if (found) return found; // stop kalau ketemu
        child = child->next;
    }

    return NULL; // tidak ketemu
}


int main() {
    const char *json_path = "/home/rascal/.dotfiles/themes/default/color-themes.json";
    const char *template_path = "/home/rascal/.dotfiles/themes/base/cava/config_extra";
    const char *root_output_path   = "/home/rascal/.dotfiles/themes/deploy/cava/config_extra";

    // baca json
    char *json_data = read_file(json_path);
    if (!json_data) return 1;

    cJSON *json = cJSON_Parse(json_data);
    if (!json) {
        printf("❌ JSON parse error\n");
        free(json_data);
        return 1;
    }

    cJSON *cava = find_json_key(json, "cava");
    if (!cava) {
        printf("❌ JSON tidak ada key 'cava'\n");
        cJSON_Delete(json);
        free(json_data);
        return 1;
    }

    // baca template
    char *template = read_file(template_path);
    if (!template) {
        cJSON_Delete(json);
        free(json_data);
        return 1;
    }

    // ganti placeholder
    char *result = strdup(template);
    cJSON *color = NULL;
    cJSON_ArrayForEach(color, cava) {
        const char *key = color->string;
        const char *val = cJSON_GetStringValue(color);
        if (key && val) {
            char *tmp = replace_placeholder(result, key, val);
            free(result);
            result = tmp;
        }
    }

    // tulis hasil
    FILE *out = fopen(root_output_path, "w");
    if (!out) {
        perror("Output error");
    } else {
        fputs(result, out);
        fclose(out);
        printf("✅ Config berhasil di-render ke %s\n", root_output_path);
    }

    // cleanup
    free(json_data);
    free(template);
    free(result);
    cJSON_Delete(json);

    return 0;
}
