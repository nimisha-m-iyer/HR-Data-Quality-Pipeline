
      insert into "hr_db"."dbt_dev_monitoring"."row_count_history" ("table_name", "row_count", "captured_at")
    (
        select "table_name", "row_count", "captured_at"
        from "row_count_history__dbt_tmp181106442930"
    )


  