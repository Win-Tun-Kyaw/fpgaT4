
titles = ["LS1","LS2","LS4","LS8","RS1","RS2","RS4","RS8","RSA1","RSA2","RSA4","RSA8","ERR00"]
ALUFNs = "b100000,b100000,b100000,b100000,b100001,b100001,b100001,b100001,b100011,b100011,b100011,b100011,b100000"
X_VALUES = "16hf001"
Y_VALUES = "16h0001,16h0002,16h0004,16h0008,16h0001,16h0002,16h0004,16h0008,16h0001,16h0002,16h0004,16h0008,16h0008"
S_VALUES = "16he002,16he004,16he010,16h0100,16h7800,16h3c00,16h0f00,16h00f0,16hf800,16hfc00,16hff00,16hfff0,16h0000";

string = "{START,"
for i in range(len(titles)):
    string+=titles[i]
    string+=","
string += "END,ERROR_STATE}"
print(string)
ALUFN = ALUFNs.split(",")
xlist = X_VALUES.split(",")
ylist = Y_VALUES.split(",")
slist = S_VALUES.split(",")
string = ""
for i in range(len(titles)):
    string += "// {0}\n".format(titles[i])
    string += "const {0}_X = {1};\n".format(titles[i],xlist[0])
    string += "const {0}_ALUFN = {1};\n".format(titles[i],ALUFN[i])
    string += "const {0}_Y = {1};\n".format(titles[i],ylist[i])
    string += "const {0}_S = {1};\n".format(titles[i],slist[i])
    string+= "\n\n"
print(string)

string = ""
for i in range(len(titles)-1):
    # string += "// {0}\n".format(titles[i]
    # string += "const {0}_X = {1};\n".format(titles[i],xlist[i])
    # string += "const {0}_ALUFN = {1};\n".format(titles[i],SUMORSUB[i])
    # string += "const {0}_Y = {1};\n".format(titles[i],ylist[i])
    # string += "const {0}_S = {1};\n".format(titles[i],slist[i])
    # string+= "\n\n"
    string += "// {0}\n".format(titles[i])
    string += "testCase.{0}:\n".format(titles[i])
    string += "shift.x = {0}_X;\n".format(titles[i])
    string += "shift.y = {0}_Y;\n".format(titles[i])
    string += "shift.op = {0}_ALUFN;\n".format(titles[i])
    string += "//turn on io_led to indicate which case we are on\n"
    string += "checkoff_reg.d[{0}] = 1;\n".format(i)
    string += "//wait for the timer\n"
    string += "// check values\n"
    string += "flag_reg.d[0] = (shift.s != {0}_S);\n".format(titles[i])      
    string += "s_reg.d = shift.s;\n" 
    string += "if (shift.s == {0}_S)".format(titles[i])
    string += "{\n"
    string += "     if (edge_detector.out == 1) {\n"
    string += "         testCase.d = testCase.{0};\n".format(titles[i+1])
    string += "     }\n"
    string += "     } else {\n"
    string += "         testCase.d = testCase.ERROR_STATE;\n" 
    string +=    "}\n\n\n"

string += "// {0}\n".format(titles[-1])
string += "testCase.{0}:\n".format(titles[-1])
string += "shift.x = {0}_X;\n".format(titles[-1])
string += "shift.y = {0}_Y;\n".format(titles[-1])
string += "shift.op = {0}_ALUFN;\n".format(titles[-1])
string += "//turn on io_led to indicate which case we are on\n"
string += "checkoff_reg.d[{0}] = 1;\n".format(12)
string += "//wait for the timer\n"
string += "// check values\n"
string += "flag_reg.d[0] = (shift.s != {0}_S);\n".format(titles[-1])      
string += "s_reg.d = 16hdead;\n" 
string += "if (shift.s == {0}_S)".format(titles[i])
string += "{\n"
string += "     if (edge_detector.out == 1) {\n"
string += "         testCase.d = testCase.ERROR_STATE;\n"
string += "     }\n"
string += "     } else {\n"
string += "         testCase.d = testCase.ERROR_STATE;\n" 
string +=    "}\n\n\n"
print(string)
