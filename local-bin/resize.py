from PIL import Image, ImageOps
import os

# Paths
input_folder = "/home/michael/datasets/render/36_fritz_woman"
output_folder = "/home/michael/datasets/render/36_fritz_woman_resized"

os.makedirs(output_folder, exist_ok=True)

# Resize and pad all images
for filename in os.listdir(input_folder):
    if filename.endswith((".jpg", ".jpeg", ".png")):
        img_path = os.path.join(input_folder, filename)
        img = Image.open(img_path)

        # Resize while maintaining aspect ratio
        img.thumbnail((1024, 1024), Image.ANTIALIAS)

        # Create a new 1024x1024 canvas with a white background
        new_img = Image.new("RGB", (1024, 1024), (255, 255, 255))
        
        # Paste resized image in the center
        x_offset = (1024 - img.size[0]) // 2
        y_offset = (1024 - img.size[1]) // 2
        new_img.paste(img, (x_offset, y_offset))

        # Save the resized image
        new_img.save(os.path.join(output_folder, filename))

print("✅ All images resized and saved without distortion!")
