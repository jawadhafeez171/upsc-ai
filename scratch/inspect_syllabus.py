import os
from pypdf import PdfReader

def inspect_pdf(pdf_path, name):
    print(f"=== {name} ===")
    reader = PdfReader(pdf_path)
    print(f"Total Pages: {len(reader.pages)}")
    
    full_text = []
    for i, page in enumerate(reader.pages):
        text = page.extract_text()
        if text:
            full_text.append(f"--- PAGE {i+1} ---\n" + text)
            
    summary_text = "\n".join(full_text[:10]) # first 10 pages
    print(summary_text[:3000])
    
    # Save full text to scratch file for thorough reference
    out_path = f"scratch/{name.replace(' ', '_').lower()}.txt"
    os.makedirs("scratch", exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(full_text))
    print(f"Saved extracted text to {out_path} ({len(''.join(full_text))} chars)")

if __name__ == "__main__":
    inspect_pdf("src/Syllabus/kas syllabus.pdf", "KAS Syllabus")
    print("\n" + "="*50 + "\n")
    inspect_pdf("src/Syllabus/upsc-syllabus.pdf", "UPSC Syllabus")
