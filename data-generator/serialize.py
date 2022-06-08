def serialize(table_name, entries):
    entries = list(entries)
    if not entries: return ""

    columns = "(" + ", ".join(
        str(c) for c in entries[0].__dict__ if c != "id") + ")"

    result = f"COPY {table_name} {columns} FROM STDIN;\n"
    for entry in entries:
        for key, value in entry.__dict__.items():
            if key != "id":
                result += (str(value) if value is not None else "\\N") + "\t"
        result = result[:-1]  # delete last tab
        result += "\n"
    result += "\\."
    return result
