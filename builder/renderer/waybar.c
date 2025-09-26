#include "header.h"

int main(int lim, char* layouts[]){
    if (lim < 2) { fprintf(stderr, "Usage: %s <layouts>\n", layouts[0]); return 1; }

    char template_path[100];
    snprintf(template_path, sizeof(template_path), "/home/rascal/.dotfiles/themes/base/waybar/%s/source.css.template", layouts[1]);
    const char* output_path = "/home/rascal/.dotfiles/themes/deploy/waybar/live/source.cssx";
    // char json_path[] = "/home/rascal/.dotfiles/themes/current/theme.json";
    char json_path[] = "/home/rascal/.dotfiles/themes/theme/Target/theme.json";

    char *json_data = NULL;
    cJSON *json = NULL;
    char *template = NULL;
    char *result = NULL;
    FILE *out = NULL;
    int ret = 0;

    json_data = read_file(json_path);
    if (!json_data) { ret = 1; goto cleanup; }
    
    json = cJSON_Parse(json_data);
    if (!json) { ret = 1; goto cleanup; }
    
    cJSON *waybar = cJSON_GetObjectItem(json, "waybar");
    if (!waybar){ ret = 1; goto cleanup; }
    
    cJSON *target = cJSON_GetObjectItem(waybar, layouts[1]);
    if (!target){
        printf("%s not found\n", layouts[1]);
        ret = 1; goto cleanup;
    }

    template = read_file(template_path);
    if (!template){ ret = 1; goto cleanup; }

    result = strdup(template);
    free(template); template = NULL;

    cJSON *conf = NULL;
    cJSON_ArrayForEach(conf, target) {
        const char *key = conf->string;
        const char *val = cJSON_GetStringValue(conf);
        if (key && val) {
            char *tmp = replace_placeholder(result, key, val);
            free(result);
            result = tmp;
        } else {
            ret = 1; goto cleanup;
        }
    }

    // Out
    out = fopen(output_path, "w");
    if (!out) {
        perror("Output error");
        ret = 1; goto cleanup;
    }
    fputs(result, out);
    fclose(out);
    out = NULL;
    printf("✅");

cleanup:
    if (out) fclose(out);
    free(result);
    free(template); // aman walaupun NULL
    free(json_data);
    if (json) cJSON_Delete(json);

    return ret;
}
