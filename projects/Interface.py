import logging


import pickle
lifespan = pickle.load(open("lifespan.pickle", 'rb')) 

print("BMI calculator")

while True:
    length= float(input("Please fill in length in centimeters: and ENTER "))
    if length >140 and length <230:
        break
            
    else:

        print("Please check and if necessary correct input")
    
    
while True:
    mass= float(input("Please fill in mass in kilograms: and ENTER "))
    if mass >40 and mass <200:
        break
            
    else:

        print("Please check and if necessary correct input")
                    

bmi=float(round(mass/(length/100)**2))
print(bmi)



smoking = float(input("smoking per day"))

while True:
    smoking= float(input("Please fill in smoking per day: and ENTER "))
    if smoking >0 and smoking <40:
        break
            
    else:

        print("Please check and if necessary correct input")
    
        
bmi= float(input(bmi))

while True:
    bmi= float(input("Please fill in output BMI calculator "))
    if bmi >14 and bmi <50:
        break
            
    else:

        print("Please check and if necessary correct input")
    
    
genetic= float(input("genetic in age"))

while True:
    genetic= float(input("Please fill in genetic: and ENTER "))
    if genetic >18 and genetic <130:
        break
            
    else:

        print("Please check and if necessary correct input")

    
exercise= float(input("exercise(=) in hours per day"))

while True:
    exercise= float(input("Please fill in exercise in hours per day: and ENTER "))
    if exercise >0 and mass <6:
        break
            
    else:

        print("Please check and if necessary correct input")

    
alcohol= float(input("alcohol glasses per day"))

while True:
    alcohol= float(input("Please fill in glasses per day: and ENTER "))
    if alcohol >40 and alcohol <200:
        break
            
    else:

        print("Please check and if necessary correct input")
    
sugar= input(("sugar in cubs per day"))

while True:
    sugar= float(input("Please fill sugar in cubes per day: and ENTER "))
    if sugar >0 and sugar <20:
        break
            
    else:

        print("Please check and if necessary correct input")
print(lifespan)



