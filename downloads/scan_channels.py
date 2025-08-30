import os
import subprocess
from pathlib import Path

with open("streams.txt") as f:
    links = [line.strip() for line in f if line.strip()]

output = []

Path("frames").mkdir(exist_ok=True)

for i, link in enumerate(links, 1):
    print(f"[{i}/{len(links)}] Capturing: {link}")
    img_file = f"frames/channel_{i}.jpg"

    # Take screenshot
    ffmpeg_cmd = [
        "ffmpeg", "-y", "-i", link, "-t", "2", "-frames:v", "1", img_file
    ]
    subprocess.run(ffmpeg_cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    # OCR
    try:
        text = subprocess.check_output(["tesseract", img_file, "stdout"], text=True)
        text = text.strip().replace("\n", " ")
    except:
        text = "ERROR"

    output.append(f"Channel {i}: {text}\nLink: {link}\n")

# Save result
with open("channel_results.txt", "w") as f:
    f.write("\n".join(output))

print("✅ Done! Check channel_results.txt")
