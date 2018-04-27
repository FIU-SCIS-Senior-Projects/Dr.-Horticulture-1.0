from PIL import Image

def getHSVsfromPixels(pixels):

	HSV = []

	for pixel in pixels:
		hue = getHueFromPixel(pixel)

		if(47 <= hue <= 180):
			sat = round(getSaturationFromPixel(pixel),2)
			bright = round(getBrightnessFromPixel(pixel),2)
			HSV.append((hue,sat,bright))	

	return HSV

def getBrightnessFromPixel(pixel):
	red = pixel[0]
	green = pixel[1]
	blue = pixel[2]
	max = getMax(red,getMax(green,blue))

	return (max/255)

def getSaturationFromPixel(pixel):
	sat = 0.0
	red = pixel[0]
	green = pixel[1]
	blue = pixel[2]
	min = red
	max = red
	min = getMin(red,getMin(green,blue))
	max = getMax(red,getMax(green,blue))

	if(max == 0):
		return max

	sat = (max - min) / max 

	return sat

def getHueFromPixel(pixel):
	hue = 0.0
	red = pixel[0]
	green = pixel[1]
	blue = pixel[2]
	min = red
	max = red
	min = getMin(red,getMin(green,blue))
	max = getMax(red,getMax(green,blue))

	if(min == max):
		return hue;

	if(max == red):
		hue = (green - blue) / (max - min)
	elif(max == green):
		hue = (blue - red) / (max - min)
	else:
		hue = (red - green) / (max - min)

	hue = hue * 60;

	if(hue < 0):
		hue = hue + 360

	return round(hue,2)

def getMax(x,y):
	if(x > y):
		return x
	elif(y > x):
		return y
	return x

def getMin(x,y):
	if(x > y):
		return y
	elif(y > x):
		return x
	return x

def getDGCIFromHSVs(HSVs):
    DGCI = 0
    aveHue = 0
    aveSat = 0
    aveVal = 0
    for HSV in HSVs:
     
        hue = HSV[0]
        aveHue = aveHue + hue
        sat = HSV[1]
        aveSat = aveSat + sat
        val = HSV[2]        
        aveVal = aveVal + val
    
    aveHue = aveHue / len(HSVs)
    aveSat = aveHue / len(HSVs)
    aveVal = aveHue / len(HSVs)

    DGCI = ( ( aveHue - 60 ) / 60 + ( 1 - aveSat ) + ( 1 - aveVal ) ) / 3

    return DGCI

def getAverage(numbers):
    sum = 0
    for number in numbers:
        sum = sum + number

    return sum / len(numbers)

def main():
    images = []
    im1 = Image.open("C:\\Users\\Vladimir\\Desktop\\Sample Images\\Plant1.jpg")
    im2 = Image.open("C:\\Users\\Vladimir\\Desktop\\Sample Images\\Plant2.jpg")
    im3 = Image.open("C:\\Users\\Vladimir\\Desktop\\Sample Images\\Plant3.jpg")
    im4 = Image.open("C:\\Users\\Vladimir\\Desktop\\Sample Images\\Plant4.jpg")
    im5 = Image.open("C:\\Users\\Vladimir\\Desktop\\Sample Images\\Plant5.jpg")
    im6 = Image.open("C:\\Users\\Vladimir\\Desktop\\Sample Images\\peppers.png")
    images.append(im1)
    images.append(im2)    
    images.append(im3)    
    images.append(im4)  
    images.append(im5)
    images.append(im6)
    file = open("C:\\Users\\Vladimir\\Desktop\\Sample Images\\log.txt", "w")


    for im in images:	

        pixels = list(im.getdata())

        HSVs = getHSVsfromPixels(list(im.getdata()))

        DGCI = getDGCIFromHSVs(HSVs)

        print("DGCI:"+str(DGCI))

        print("\n\n")    
    
    file.close()

def getIndexFromImage(im):
    
    pixels = list(im.getdata())

    HSVs = getHSVsfromPixels(list(im.getdata()))

    return getDGCIFromHSVs(HSVs)

main()
