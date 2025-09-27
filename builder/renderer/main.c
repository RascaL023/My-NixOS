#include "header.h"

// cari key di seluruh tree JSON (rekursif)
cJSON *find_json_key(cJSON *root, const char *key) {
    if (!root) return NULL;
    else if (root->string && strcmp(root->string, key) == 0) return root;

    cJSON *child = root->child;
    while (child) {
        cJSON *found = find_json_key(child, key);
        if (found) return found;
        child = child->next;
    }return NULL;
}

int main(int argc, char* params[]) {
    // Map output file
    struct {
        const char *name;
        const char *suffix;
    } mapping[] = {
        {"kitty",    "/colors.conf"},
        {"cava",     "/config_extra"},
        {"gtk-3.0",  "/gtk.css"},
        {"hyprland", "/ui.conf"}
    };

    // =========== INPUT ===========
    if (argc < 3) { fprintf(stderr, "Usage: %s <root> <theme>\n", params[0]); return 1; }
    
    const char *apps[] = { "kitty", "cava", "gtk-3.0", "hyprland" };
    size_t apps_count = sizeof(apps) / sizeof(apps[0]);

    char *json_path = build_path("%s/theme/%s/theme.json", params[1], params[2]);

    char *apps_path[apps_count];
    for (size_t i = 0; i < apps_count; i++) apps_path[i] = build_path("%s/base/%s/config.template", params[1], apps[i]);    

    const char *root_output_path   = "/home/rascal/.dotfiles/themes/deploy/";

    // baca json
    char *json_data = read_file(json_path);
    if (!json_data) {
        for (size_t i = 0; i < apps_count; i++) free(apps_path[i]);
        free(json_path);
        return 1;
    }

    cJSON *json = cJSON_Parse(json_data);
    if (!json) {
        printf("❌ JSON parse error\n");
        for (size_t i = 0; i < apps_count; i++) free(apps_path[i]);
        free(json_path);
        return 1;
    }

    // =========== PROCESS ===========
    for(size_t i = 0; i < apps_count; i++){
        cJSON *app = find_json_key(json, apps[i]);
        if (!app) {
            printf("❌ JSON tidak ada key %s\n", apps[i]);
            for (size_t i = 0; i < apps_count; i++) free(apps_path[i]);
            cJSON_Delete(json);
            free(json_data);
            return 1;
        }

        // baca template
        char *template = read_file(apps_path[i]);
        if (!template) {
            cJSON_Delete(json);
            for (size_t i = 0; i < apps_count; i++) free(apps_path[i]);
            free(json_data);
            return 1;
        }

        // ganti placeholder
        char *result = strdup(template); free(template); // ✅ template sudah tidak perlu, jadi dibuang
        cJSON *conf = NULL;
        cJSON_ArrayForEach(conf, app) {
            const char *key = conf->string,  *val = cJSON_GetStringValue(conf);
            if (key && val) {
                char *tmp = replace_placeholder(result, key, val);
                free(result);
                result = tmp;
            }
        }

        // =========== OUTPUT ===========
        char output_path[strlen(root_output_path) + strlen(mapping[i].name) + strlen(mapping[i].suffix) + 1];
        snprintf(output_path, sizeof(output_path), "%s%s%s", root_output_path, mapping[i].name, mapping[i].suffix);

        FILE *out = fopen(output_path, "w");
        if (!out) {
            printf("%s ", apps[i]);
            perror("Output error");
        } else {
            fputs(result, out);
            fclose(out);
            printf("✅ Config %s berhasil di-render ke %s\n", apps[i], output_path);
        }free(result);
    }

    // cleanup
    free(json_path);
    free(json_data);
    for (size_t i = 0; i < apps_count; i++) free(apps_path[i]);
    cJSON_Delete(json);

    return 0;
}
