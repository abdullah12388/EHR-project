import pytesseract
from PIL import Image

img = Image.open('t11.PNG')
pytesseract.pytesseract.tesseract_cmd = 'C:\Program Files (x86)\Tesseract-OCR\\tesseract.exe'
result = pytesseract.image_to_string(img)

with open('magic.txt',mode='w') as file:
    file.write(result)
    print('see the magic file')