def genPascal(num):
    pAppend = ''
    nom = []
    for x in range(num):
        num -= 1
        nom2 = []
        pAppend += '\n'
        
        for y in range(num):
            pAppend += ' '
        for y in range(1, 2*x+2):
            if (y % 2) == 0:
                cNum = int(y / 2)
                if cNum == 1 or cNum == x:
                    d = 1
                else:
                    d = nom[cNum - 1] + nom[cNum - 2]
                pAppend += str(d)
                nom2.append(d)
            else:
                pAppend += ' '
        nom = nom2
        
    print(pAppend)
        
num = 6
print('Test:\n')
genPascal(num)
        
