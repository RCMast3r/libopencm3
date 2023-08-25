with open(
    "out.txt", 'r') as r, open(
        'out2.txt', 'w') as o:
      
    for line in r:
        #isspace() function
        if not line.isspace():
            o.write(line)