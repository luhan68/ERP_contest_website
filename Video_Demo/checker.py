file = open("output.txt", "r")

line1 = file.readline().split('\n')
line2 = file.readline().split('\n')
line3 = file.readline().split('\n')

observed_error = False

try:
    float(line1[0])
except ValueError:
    print("Prediction (line 1) needs to be a real number!")
    observed_error = True

try:
    int(line2[0])
except ValueError:
    print("The number of buys (line 2) needs to be an integer!")
    observed_error = True

try:
    int(line3[0])
except ValueError:
    print("The number of sales (line 3) needs to be an integer!")
    observed_error = True

if not observed_error:
    if int(line2[0]) < 0:
        print("Error: the number of buys (line 2) must be non-negative!")
    elif int(line3[0]) < 0:
        print("Error: the number of sales (line 3) must be non-negative!")
    else:
        print("Success! All checkers passed!")

file.close()
