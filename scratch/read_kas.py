import fitz # PyMuPDF
import pdfplumber

def read_kas():
    print("=== READING KAS SYLLABUS WITH PYMUPDF ===")
    doc = fitz.open("src/Syllabus/kas syllabus.pdf")
    print("Pages in KAS:", len(doc))
    for i, page in enumerate(doc):
        text = page.get_text()
        print(f"--- PAGE {i+1} (chars: {len(text)}) ---")
        print(text[:1500])
        print("\n" + "-"*40 + "\n")
        
    with open("scratch/kas_syllabus_fitz.txt", "w", encoding="utf-8") as f:
        for i, page in enumerate(doc):
            f.write(f"--- PAGE {i+1} ---\n" + page.get_text() + "\n\n")

if __name__ == "__main__":
    read_kas()
