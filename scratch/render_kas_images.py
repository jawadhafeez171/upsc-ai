import pymupdf
import os

doc = pymupdf.open("src/Syllabus/kas syllabus.pdf")
os.makedirs("scratch/kas_images", exist_ok=True)

for i, page in enumerate(doc):
    pix = page.get_pixmap(dpi=150)
    img_path = f"scratch/kas_images/kas_page_{i+1}.png"
    pix.save(img_path)
    print(f"Saved page {i+1} to {img_path} ({pix.width}x{pix.height})")
