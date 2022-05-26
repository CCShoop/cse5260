#include <stdio.h>
#include <stdlib.h>
#include <sqlite3.h>
#include <string.h>

int main(void) {
    char data[6] = "AAAAA", sql[55] = "INSERT INTO events VALUES(", new[30] = "", *err_msg = 0;
    printf("%s\n", sqlite3_libversion());

    sqlite3 *db;
    int rc = sqlite3_open("shoop_meyer_project_1.sqlite", &db);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "Cannot open database: %s\n", sqlite3_errmsg(db));
        sqlite3_close(db);
        return (1);
    }

    for (int i = 0; i < 100; i++) {
        
        snprintf(new, 30, "%d", (i+1)*4);
        strcat(sql, new); //Event_ID
        strcat(sql, ", ");
        strcat(sql, "\"");
        strcat(sql, data); //Event_Name
        strcat(sql, "\", \"now\");"); //Event_Date
        printf("Executing %s\n", sql);

	rc = sqlite3_exec(db, sql, 0, 0, &err_msg);

	if (rc != SQLITE_OK) {
	    fprintf(stderr, "SQL error: %s\n", err_msg);
	    sqlite3_free(err_msg);
	    sqlite3_close(db);
	    return (1);
	}

        strcpy(sql, "INSERT INTO events VALUES(");       
        for (int j = 4; j >= 0; j--) {
            if (data[j] != 'Z') {
                data[j]++;
                break;
            }
            else if (j < 4)
                data[j] = 'A';
        }
    }

    printf("Closing database...\n");
    sqlite3_close(db);
    printf("Database filled successfully! Check it now.\n");
    system("sqlite3 shoop_meyer_project_1.sqlite");

    return (0);
}
