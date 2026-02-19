import json

INPUT_NOTEBOOK = "ProyectoFinal2.ipynb"
OUTPUT_SCRIPT = "notebook_extracted.py"

def extract_code_cells(input_path, output_path):
    with open(input_path, "r", encoding="utf-8") as f:
        notebook = json.load(f)

    with open(output_path, "w", encoding="utf-8") as out:
        for cell in notebook["cells"]:
            if cell["cell_type"] == "code":
                out.write("# --- New Cell ---\n")
                out.writelines(cell["source"])
                out.write("\n\n")

if __name__ == "__main__":
    extract_code_cells(INPUT_NOTEBOOK, OUTPUT_SCRIPT)
    print("Código extraído correctamente.")
