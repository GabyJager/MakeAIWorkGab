

import logging
import pandas as pd
import pickle
import statsmodels as sm
import statsmodels.formula.api as smf
import sqlite3

# Global configuration
logging.basicConfig(level=logging.DEBUG)
lifespan = pickle.load(open("../Model/lifespan.pickle", 'rb')) 

def predict(smoking, bmi, genetic, exercise, alcohol, sugar):

    # Predict lifespan with regressor and inputData
    prediction = lifespan.predict([[smoking, bmi, genetic, exercise, alcohol, sugar]])
    return prediction



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





while True:
    smoking = float(input("smoking per day: and ENTER "))
    if smoking >=0 and smoking <40:
        break
            
    else:

        print("Please check and if necessary correct input")

    

while True:
    genetic= float(input("genetic in age: and ENTER "))
    if genetic >=18 and genetic <130:
        break
            
    else:

        print("Please check and if necessary correct input")

    
while True:
    exercise= float(input("exercise in hours per day: and ENTER "))
    if exercise >=0 and exercise <6:
        break
            
    else:

        print("Please check and if necessary correct input")

    
while True:
    alcohol= float(input("alcohol glasses per day: and ENTER "))
    if alcohol >=0 and alcohol <30:
        break
            
    else:

        print("Please check and if necessary correct input")


while True:
    sugar= float(input("Please fill sugar in cubes per day: and ENTER "))
    if sugar >=0 and sugar <20:
        break
            
    else:

        print("Please check and if necessary correct input")

print(smoking, bmi, genetic, exercise, alcohol, sugar)
prediction = predict(smoking, bmi, genetic, exercise, alcohol, sugar)
print(prediction)
